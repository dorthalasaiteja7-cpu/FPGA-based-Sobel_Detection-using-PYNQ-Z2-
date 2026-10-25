#include "hls_sobel_axi_stream.hpp"
#include "imgproc/xf_sobel.hpp"
#include "imgproc/xf_cvt_color.hpp"
#include "imgproc/xf_add_weighted.hpp"
#include "imgproc/xf_threshold.hpp"

template <int SRC_T, int ROWS, int COLS, int NPC>
void roi_mask(xf::cv::Mat<SRC_T, ROWS, COLS, NPC>& _src,
              xf::cv::Mat<SRC_T, ROWS, COLS, NPC>& _dst,
              int roi_y_start, int roi_y_end) {
#pragma HLS INLINE OFF
    int rows = _src.rows;
    int cols = _src.cols;
ROI_ROW_LOOP:
    for (int r = 0; r < rows; r++) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=ROWS
    ROI_COL_LOOP:
        for (int c = 0; c < cols; c++) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=COLS
#pragma HLS PIPELINE II=1
            XF_TNAME(SRC_T, NPC) pix = _src.read(r * cols + c);
            bool in_roi = (r >= roi_y_start) && (r < roi_y_end);
            _dst.write(r * cols + c, in_roi ? pix : (XF_TNAME(SRC_T, NPC))0);
        }
    }
}

void hls_sobel_axi_stream_top(
    hls::stream<ap_axiu<AXIS_W,1,1,1> >& _src,
    hls::stream<ap_axiu<AXIS_W,1,1,1> >& _dst) {
#pragma HLS INTERFACE axis port=_src
#pragma HLS INTERFACE axis port=_dst
#pragma HLS INTERFACE ap_ctrl_none port=return

    const int rows = 720;
    const int cols = 1280;

    xf::cv::Mat<XF_8UC3, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_0(rows, cols);
    xf::cv::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_1(rows, cols);
    xf::cv::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_1r(rows, cols); // after ROI
    xf::cv::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_1a(rows, cols);
    xf::cv::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_1b(rows, cols);
    xf::cv::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_2(rows, cols);
    xf::cv::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_2a(rows, cols); // binary edge mask
    xf::cv::Mat<XF_8UC3, XF_HEIGHT, XF_WIDTH, XF_NPPC1> img_buf_3(rows, cols);

#pragma HLS dataflow
    xf::cv::AXIvideo2xfMat(_src, img_buf_0);
    xf::cv::bgr2gray<XF_8UC3, XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1>(img_buf_0, img_buf_1);
     roi_mask<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1>(img_buf_1, img_buf_1r, rows / 2 - 30, rows);
    xf::cv::Sobel<0, 3, XF_8UC1, XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1, false>(img_buf_1, img_buf_1a, img_buf_1b);
    xf::cv::addWeighted<XF_8UC1, XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1>(img_buf_1a, 0.5, img_buf_1b, 0.5, 0, img_buf_2);
    xf::cv::Threshold<XF_THRESHOLD_TYPE_BINARY, XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1>(
        img_buf_2, img_buf_2a, 50, 255);
    xf::cv::gray2bgr<XF_8UC1, XF_8UC3, XF_HEIGHT, XF_WIDTH, XF_NPPC1>(img_buf_2, img_buf_3);
    xf::cv::xfMat2AXIvideo(img_buf_3, _dst);
    return;
}