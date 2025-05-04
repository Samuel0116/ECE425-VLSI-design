# ECE425: mp_datapath README

**This document, `README.md`, forms the specification for the machine problem. For a more comprehensive summary, see [GUIDE.md](./GUIDE.md).**

# Custom Design RISC-V Processor Datapath Layout

Your designs should be located in a new Virtuoso library: `mp_datapath`.

You will design the schematic and layout of the datapath of a bit-sliced RISC-V32I compliant single-cycle processor
(with the exception of `FENCE*`, `ECALL`, `EBREAK`, and `CSRR*` instructions).
Execution of `SLL*`, `SRL*`, `SRA*` instructions is extra credit.

The entire design is provided to you in SystemVerilog. Use it as a reference.
You do not need to create the schematic or layout for the control unit.

You can modify the provided code to add more signals that are connected between your datapath and control unit.
Any logic added to the controller may not be something that can be bitsliced.

Your top level design cell should be named `datapath`, and your bitslice should be named `bitslice`.
If you choose to attempt the shifter for extra credit, you should put it in a new cell called `datapath_s`.
Your `datapath` cell should still be a design that does not have the shifter.
This is so that you are not placed at a disadvantage in the area competition.

You are allowed to use up to (and including) `metal6`.

The datapath should be 32 identical bitslice instances stitched together.

The bitsliced inputs to your datapath are `dmem_rdata` and `imm`.
The bitsliced outputs from your datapath are `dmem_addr`, `dmem_wdata`, and `imem_addr`.
All of these should be on either the leftmost or the rightmost edge of your bitslice.
All signals from and to the controller should be wired the top edge of your datapath.

# Grading

## Submission

You will be graded on the files on the `main` branch in your class GitHub repository on the specified deadline.

You should also include your `cpu.sv` and `control.sv`, modified or not.

Your GitHub repo should look like this:
```
your_github_repo
├── release
│   ├── mp_datapath
│   │   ├── sim
│   │   │   ├── hdl
│   │   │   │   ├── cpu.sv
│   │   │   │   ├── control.sv
│   │   │   │   └── ...
│   │   │   └── ...
│   │   └── ...
│   └── ...
├── mp_intro
│   ├── cdsinfo.tag
│   ├── data.dm
│   ├── buf
│   └── inv
├── mp_stdcell
│   ├── cdsinfo.tag
│   ├── data.dm
│   ├── and2
│   ├── aoi21
│   ├── buf
│   └── ...
├── mp_datapath
│   ├── cdsinfo.tag
│   ├── data.dm
│   ├── datapath
│   ├── bitslice
│   └── ...
├── cds.lib
└── lib.defs
```

# Checkpoints
This MP will be partitioned into two checkpoints.

- **CP1**: You are expected to finish the schematic.
- **CP2**: You are expected to finish the layout.

## Grading

This assignment is graded out of 10 points and floored at 0 points.

| CP   | Pts |
|------|-----|
| CP1  | 2   |
| CP2  | 8   |

### CP1
Points will be awarded in CP1 if and only if the schematic passes digital simulation on the provided testcase.

### CP2
Each mistake/error will get these points deducted:

| Metric                     | Points    |
|---|---|
| Incorrect schematic        | up to -8  |
| Failing DRC / LVS          | up to -8  |
| Layout style               | up to -8  |

Although this rubric looks strict, we will grade fairly and generously.

Partial credit is awarded. If you find that you are unable to finish,
do as much as you can and focus on making parts of the CPU bitsliced and connected together properly.
For example, a fully connected bitsliced ALU or a fully functional single bitslice will be awarded partial credit.

Style points will not be deducted for most submissions.
It is a catch-all clause to penalize designs that are not bitsliced,
design with excess wasted area, bitslicable logic added to the controller, etc.

`SLL*`, `SRL*`, `SRA*` support is extra credit and is worth 2 points in total.

Area extra credit is as follows:

| Place            | Points |
|------------------|--------|
| 1st              | +3 |
| 2nd-5th          | +2 |
| 6th-15th         | +1 |
| 16th-last        | +0 |

Designs that do not receive full base credit will not be eligible for the area competition.
Designs that exploit the DRC checker bug will be disqualified.
