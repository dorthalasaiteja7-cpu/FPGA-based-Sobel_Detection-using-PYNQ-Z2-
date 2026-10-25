
wire kernel_monitor_reset;
wire kernel_monitor_clock;
wire kernel_monitor_report;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
assign kernel_monitor_report = 1'b0;
wire [3:0] axis_block_sigs;
wire [12:0] inst_idle_sigs;
wire [5:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_start_hunt_fu_110.p_src_TDATA_blk_n;
assign axis_block_sigs[1] = ~AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_col_zxi2mat_fu_130.p_src_TDATA_blk_n;
assign axis_block_sigs[2] = ~AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_last_hunt_fu_157.p_src_TDATA_blk_n;
assign axis_block_sigs[3] = ~xfMat2AXIvideo_24_16_1080_1920_1_2_U0.grp_xfMat2AXIvideo_24_16_1080_1920_1_2_Pipeline_loop_col_mat2axi_fu_74.p_dst_TDATA_blk_n;

assign inst_idle_sigs[0] = AXIvideo2xfMat_24_16_1080_1920_1_2_U0.ap_idle;
assign inst_block_sigs[0] = (AXIvideo2xfMat_24_16_1080_1920_1_2_U0.ap_done & ~AXIvideo2xfMat_24_16_1080_1920_1_2_U0.ap_continue) | ~AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_col_zxi2mat_fu_130.img_buf_0_data_blk_n;
assign inst_idle_sigs[1] = bgr2gray_16_0_1080_1920_1_2_2_U0.ap_idle;
assign inst_block_sigs[1] = (bgr2gray_16_0_1080_1920_1_2_2_U0.ap_done & ~bgr2gray_16_0_1080_1920_1_2_2_U0.ap_continue) | ~bgr2gray_16_0_1080_1920_1_2_2_U0.grp_bgr2gray_16_0_1080_1920_1_2_2_Pipeline_columnloop_fu_36.img_buf_0_data_blk_n | ~bgr2gray_16_0_1080_1920_1_2_2_U0.grp_bgr2gray_16_0_1080_1920_1_2_2_Pipeline_columnloop_fu_36.img_buf_1_data_blk_n;
assign inst_idle_sigs[2] = Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.ap_idle;
assign inst_block_sigs[2] = (Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.ap_done & ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.ap_continue) | ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.grp_xFSobelFilter3x3_0_0_1080_1920_1_0_0_1_2_2_2_1_1_1920_false_s_fu_18.grp_xFSobelFilter3x3_Pipeline_Clear_Row_Loop_fu_136.img_buf_1_data_blk_n | ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.grp_xFSobelFilter3x3_0_0_1080_1920_1_0_0_1_2_2_2_1_1_1920_false_s_fu_18.grp_xFSobelFilter3x3_Pipeline_Col_Loop_fu_146.img_buf_1_data_blk_n | ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.grp_xFSobelFilter3x3_0_0_1080_1920_1_0_0_1_2_2_2_1_1_1920_false_s_fu_18.grp_xFSobelFilter3x3_Pipeline_Col_Loop_fu_146.img_buf_1a_data_blk_n | ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.grp_xFSobelFilter3x3_0_0_1080_1920_1_0_0_1_2_2_2_1_1_1920_false_s_fu_18.img_buf_1a_data_blk_n | ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.grp_xFSobelFilter3x3_0_0_1080_1920_1_0_0_1_2_2_2_1_1_1920_false_s_fu_18.grp_xFSobelFilter3x3_Pipeline_Col_Loop_fu_146.img_buf_1b_data_blk_n | ~Sobel_0_3_0_0_1080_1920_1_false_2_2_2_U0.grp_xFSobelFilter3x3_0_0_1080_1920_1_0_0_1_2_2_2_1_1_1920_false_s_fu_18.img_buf_1b_data_blk_n;
assign inst_idle_sigs[3] = addWeighted_0_0_1080_1920_1_2_2_2_U0.ap_idle;
assign inst_block_sigs[3] = (addWeighted_0_0_1080_1920_1_2_2_2_U0.ap_done & ~addWeighted_0_0_1080_1920_1_2_2_2_U0.ap_continue) | ~addWeighted_0_0_1080_1920_1_2_2_2_U0.grp_addWeighted_0_0_1080_1920_1_2_2_2_Pipeline_ColLoop_fu_38.img_buf_1a_data_blk_n | ~addWeighted_0_0_1080_1920_1_2_2_2_U0.grp_addWeighted_0_0_1080_1920_1_2_2_2_Pipeline_ColLoop_fu_38.img_buf_1b_data_blk_n | ~addWeighted_0_0_1080_1920_1_2_2_2_U0.grp_addWeighted_0_0_1080_1920_1_2_2_2_Pipeline_ColLoop_fu_38.img_buf_2_data_blk_n;
assign inst_idle_sigs[4] = gray2bgr_0_16_1080_1920_1_2_2_U0.ap_idle;
assign inst_block_sigs[4] = (gray2bgr_0_16_1080_1920_1_2_2_U0.ap_done & ~gray2bgr_0_16_1080_1920_1_2_2_U0.ap_continue) | ~gray2bgr_0_16_1080_1920_1_2_2_U0.grp_gray2bgr_0_16_1080_1920_1_2_2_Pipeline_columnloop_fu_36.img_buf_2_data_blk_n | ~gray2bgr_0_16_1080_1920_1_2_2_U0.grp_gray2bgr_0_16_1080_1920_1_2_2_Pipeline_columnloop_fu_36.img_buf_3_data_blk_n;
assign inst_idle_sigs[5] = xfMat2AXIvideo_24_16_1080_1920_1_2_U0.ap_idle;
assign inst_block_sigs[5] = (xfMat2AXIvideo_24_16_1080_1920_1_2_U0.ap_done & ~xfMat2AXIvideo_24_16_1080_1920_1_2_U0.ap_continue) | ~xfMat2AXIvideo_24_16_1080_1920_1_2_U0.grp_xfMat2AXIvideo_24_16_1080_1920_1_2_Pipeline_loop_col_mat2axi_fu_74.img_buf_3_data_blk_n;

assign inst_idle_sigs[6] = 1'b0;
assign inst_idle_sigs[7] = AXIvideo2xfMat_24_16_1080_1920_1_2_U0.ap_idle;
assign inst_idle_sigs[8] = AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_start_hunt_fu_110.ap_idle;
assign inst_idle_sigs[9] = AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_col_zxi2mat_fu_130.ap_idle;
assign inst_idle_sigs[10] = AXIvideo2xfMat_24_16_1080_1920_1_2_U0.grp_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_last_hunt_fu_157.ap_idle;
assign inst_idle_sigs[11] = xfMat2AXIvideo_24_16_1080_1920_1_2_U0.ap_idle;
assign inst_idle_sigs[12] = xfMat2AXIvideo_24_16_1080_1920_1_2_U0.grp_xfMat2AXIvideo_24_16_1080_1920_1_2_Pipeline_loop_col_mat2axi_fu_74.ap_idle;

hls_sobel_axi_stream_top_hls_deadlock_idx0_monitor hls_sobel_axi_stream_top_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
