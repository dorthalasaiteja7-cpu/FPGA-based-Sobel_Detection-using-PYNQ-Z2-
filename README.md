# FPGA-based-Sobel_Detection-using-PYNQ-Z2-
Sobel Edge detection using PYNQ -Z2 FPGA  board by integrating software and hardware description languages

use XILINX Vivado 2025.2 version. 
'.bd' file is the main file of block diagram that contains other ip's  that are synthesized by VItis Embedded software version 2025.2.
export hardware after verifying that hdmi passthorugh is properly working in PYNQ-Z2 board, that should be don in constraint file ed.xdc activating all the HDMI pins 
after exporting .xsa file from vivado go to vitis embedded software tool setup the platform for PYNQ z2 board and write code for sobel edge filter based on OPNCV software 
this C++ codes in Vitis should given an image in foramt of .ppm we ccan convert that actual .jpg file into .ppm and vice versa in folder itself "conversion.py" in given.
