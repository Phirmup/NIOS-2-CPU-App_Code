# Nios-II-CPU-application-code
DE10 Computer System with Nios II source code ﬁles

The Nios II Embedded Design Suite (EDS) is a comprehensive development package for Nios II software design. The Nios II EDS contains development tools, but also software, device drivers, bare metal Hardware Abstraction Layer (HAL) library, a commercial grade network stack software and evaluation version of a real-time operating system.
This describes a computer system that can be implemented on the Intel DE10-Nano development board. The DE10-Nano, is intended for use in experiments on computer and embedded systems. To support such experiments, the system contains embedded processors, memory, audio and video devices, and some simple I/O peripherals. The FPGA programming ﬁle that implements this system, as well as its design source ﬁles.
An overview of it provides an easy way to assemble/compile Nios II programs written in either assembly language or the C language. IT is an application program that runs on the host computer connected to the DE10-Nano board. The Monitor Program can be used to control the execution of code on Nios II, list (and edit) the contents of processor registers, display/edit the contents of memory on the DE10-Nano board, and similar operations. It includes the DE10-Nano as a predesigned system that can act, as well as several sample programs peripherals.
HPS and FPGA onboard the Terasic DE10-Nano
Terasic DE10-Nano development kit contains an Intel Cyclone V device. The device contains a Hard Processor System (HPS) and field-programmable gate array (FPGA) with peripherals onboard for creating applications.  To accomplish with system to control the hardware that are physically connected to the FPGA.  There are different methods for controlling the board using the command line, memory mapped IO, schematic, and VHDL, for an application development like firmware engineering.
DE10-Nano Board Contents
The components in this system are implemented utilizing both the FPGA and the Hard Processor System (HPS) inside Intel Cyclone V SoC chip. The FPGA implements two Nios II processors and several peripheral ports: memory, timer modules, audio-in/out, video-in/out, PS/2, analog-to-digital, infrared receive/transmit, and parallel ports connected to switches and lights. The HPS comprises an ARM Cortex A9 dual-core processor and a set of peripheral devices.
FPGA Components
Many of the components in the DE10-Nano board are implemented inside the FPGA in the Cyclone V SoC chip.
Nios II Processor
The Intel Nios II processor is a 32-bit CPU that can be implemented in an Intel FPGA device. Two versions of the Nios II processor are available, designated economy (/e) and fast (/f). The DE10-Standard Computer includes two instances of the Nios II/f version, conﬁgured with ﬂoating-point hardware support.
All of the I/O peripherals in the DE10-Nano board are accessible by the processor as memory mapped devices, using the address ranges.
