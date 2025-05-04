# ECE425: mp_stdcell README

**This document, `README.md`, forms the base specification for the machine problem. For a more comprehensive summary, see [GUIDE.md](./GUIDE.md).**

# Standard Cells

These deliverables are useful for `mp_datapath`, and required for `mp_pnr`.

Your designs should be located in a new Virtuoso library: `mp_stdcell`.

Your cell should be laid out such that they can fit side-by-side in a row:
- All cells should be of the same height (referring to the vertical direction in layout).
- wells across cells should be of the same height (referring again to the vertical direction in layout) and extend left and right to at least the same extent as the power rails.
- Both `vdd` and `vss` rails should be 200nm wide.
- At least `ceil((min_spacing_between_metal_2) / 2)` of white space on the left and right sides of the cell on the metal 1 and 2 layers excluding the power rails.

Your cell should be area efficient:
- Should be reasonably compact, ideally the smallest allowed by DRC (white space due to cell height is allowed).
- Merge the sources and/or drains of transistors in series as much as possible.
  - Some will share a terminal such that it is the source of one and the drain of the other.
  - Some will not have the middle terminal at all, in which case there will be two or more gates over a single active area.
  - Some will share a terminal such that it is the source/drain of both.

You are allowed to use up to metal 2 in your design. All of your pins should be accessible on metal 2.

You should include well taps inside your cells.

All of your cells should have a worst-case pull up and pull down strength equivalent to a w=90nm l=50nm NMOS.
All gates should have a length of 50nm. Assume an NMOS is twice as conductive as a PMOS.

All of your combinational cells must be CMOS.

No complements of existing inputs are allowed as inputs to your cells.
If you need complements, use inverters inside your cells.

You are required to implement the following standard cells:

| Name      | Description | Remarks |
|---|---|---|
|`and2`     | `Y = A & B`                       | |
|`aoi21`    | `Y = ~((A & B) \| C)`             | |
|`buf`      | `Y = A`                           | two `INV` chained |
|`dff`      | d-flip-flop                       | See guide |
|`latch`    | d-latch                           | See guide |
|`inv`      | `Y = ~A`                          | |
|`mux2`     | `Y = (~S0 & A) \| (S0 & B)`       | |
|`nand2`    | `Y = ~(A & B)`                    | |
|`nor2`     | `Y = ~(A \| B)`                   | |
|`oai21`    | `Y = ~((A \| B) & C)`             | |
|`or2`      | `Y = A \| B`                      | |
|`xnor2`    | `Y = ~(A ^ B)`                    | 10 transistors |
|`xor2`     | `Y = A ^ B`                       | 10 transistors |

The cell names in your Virtuoso library must be exactly the same as the names shown in this table.

# Grading

## Submission

You will be graded on the files on the `main` branch in your class GitHub repository on the specified deadline.

Your GitHub repo should look like this:
```
your_github_repo
├── release
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
├── cds.lib
└── lib.defs
```

## Rubric

Each cell is worth 5 points.

Each cell must pass functional simulation.
Each cell must pass DRC and LVS.
If these requirements are not met for a given cell, no points will be awarded for it.

If the cell is not reasonably clean and compact, some points will be deducted.
