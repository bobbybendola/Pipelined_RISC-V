# Pipelined_RISC-V

Coursework for EECS 112L (UC Irvine): building up a 32-bit MIPS processor in Verilog, from a basic ALU to a single-cycle datapath and a pipelined design. Projects are built and simulated in Xilinx Vivado.

## Labs

| Lab | Topic | Location |
| --- | --- | --- |
| 1 | ALU and flip-flops (ALU, D flip-flops with set/reset and PC, testbenches) | `LAB_1/` |
| 2 | Single-cycle MIPS processor (R-type, `addi`, `lw`, `sw`, `beq`, `j`) | `LAB_2/` |
| 3 | MIPS assembly and machine-code programs run on the Lab 2 processor | `LAB_3/` |
| 4 | Pipelined processor with hazard detection and forwarding | `LAB_4/` (in progress) |

Each lab has a write-up with waveform screenshots and design notes. Reports on `main` are listed in the layout below; the rest are on the lab branches.

## Repository layout

```
LAB_1/
  LAB_1.xpr                  Vivado project
  LAB_1.srcs/                design sources and testbenches
  Steven_Kuzhipala_Lab1.pdf  report
LAB_2/
  LAB_2/LAB_2.xpr            Vivado project
  LAB_2/LAB_2.srcs/          datapath, control, ALU, memories, testbench
  lab2_files/                starter files provided with the lab
LAB_3/
  lab3.txt                   assembly and machine code for each program
  Steven_Kuzhipala_Lab3.pdf  report
```

## Running a simulation

1. Open the lab's `.xpr` file in Vivado.
2. Select the testbench as the simulation top module (`tb_alu`, `tb_dff_PC`, `tb_dff_SR` for Lab 1; `tb_mips_32` for Lab 2).
3. Run Behavioral Simulation.

Vivado regenerates its `.cache`, `.sim`, `.hw`, and `.ip_user_files` folders on open; they are not tracked.

## Branches

| Branch | Contents |
| --- | --- |
| `main` | Current state of all labs |
| `ALU_Fixes_8Bit` | Lab 1 work, including documentation of errors found and design choices |
| `MIPS_Processor_Single_Cycle` | Lab 2 development history |
| `C_on_MIPs_Processor` | Lab 3 development history (same tip as `main`) |
