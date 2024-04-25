# Logical Networks :floppy_disk:

This project involves the design and development of a **VHDL** module based on a natural language specification of its operation.

The primary goal is to apply advanced circuit design techniques using VHDL and synthesis tools commonly used for **FPGA** development, particularly leveraging Xilinx VIVADO software.

The synthesis process is also explored, which converts the VHDL code into a configuration bitstream for FPGA programming.

## Histogram Equalization for Image Processing

[Histogram equalization algorithm](https://en.wikipedia.org/wiki/Histogram_equalization) is a technique designed to recalibrate the contrast of an image when the intensity value range is very close, by distributing it across the entire intensity range to increase the contrast.

In the developed version, the standard algorithm is not implemented but rather a simplified version of it. The equalization algorithm will only be applied to grayscale images with 256 levels, and it must transform each pixel as follows:

```plaintext
DELTA_VALUE = MAX_PIXEL_VALUE – MIN_PIXEL_VALUE
SHIFT_LEVEL = (8 – FLOOR(LOG2(DELTA_VALUE +1)))
TEMP_PIXEL = (CURRENT_PIXEL_VALUE - MIN_PIXEL_VALUE) << SHIFT_LEVEL
NEW_PIXEL_VALUE = MIN(255, TEMP_PIXEL)
```

Where MAX_PIXEL_VALUE and MIN_PIXEL_VALUE are the maximum and minimum pixel values of the image, CURRENT_PIXEL_VALUE is the value of the pixel to be transformed, and NEW_PIXEL_VALUE is the value of the new pixel.

The module reads the image from a memory where the image to be processed is stored sequentially, row by row. Each byte corresponds to a pixel of the image.

The size of the image is defined by 2 bytes, stored starting from address 0. The byte at address 0 refers to the column dimension, and the byte at address 1 refers to the row dimension. The maximum size of the image is 128x128 pixels.

The image is stored starting from address 2 and in contiguous bytes. Therefore, the byte at address 2 is the first pixel of the first row of the image.

Full **description of the assignment** is available [here](/PFRL_Specifica_20_21_V3.pdf) (in italian).

## Solution
The implementation consists of a finite state machine that determins the phases of the following datapath containing all the needed components for the computation of the histogram equalization algorithm.

A detailed **explanation** of the whole implementation is available [here](/report.pdf) (in italian).

## Datapath 
![datapath](img/DATAPATH.jpg)
## FSM
![FSM](/img/FSM.png)
