## Building and Using Check

### Prerequisites

Check is written in Coq and extracted to OCaml for compilation to a native
executable.  Check requires Coq (v4.0 or later) and OCaml (tested on
version 8.4pl5).  The authors have compiled and executed Check successfully
on both Linux and Mac.

- Coq
  - tested with Coq 8.4pl5 (October 2014)
- OCaml
  - tested with OCaml 4.01.0
- neato, part of GraphViz (only for visualization)
  - tested with 2.36.0 (20140111.2315)
- herd, part of diy (http://diy.inria.fr/herd)
  - tested with herd 5.99-D (as part of diy-5.99-D)

(all of the above tested on a Mac with Yosemite)

### Building

1. `make`
2. (optional, can be slow) `make web`

## Usage

Basic Usage:

`./src/pipecheck -i <litmus test> -m <uspec model> [-o <generated neato graph>]`

For more options, just run `pipecheck` by itself to see the list of available
flags.

## Sample Usage

1. `mkdir graphs`
2. `./src/pipecheck -i tests/x86tso/sb.test -m uarches/FiveStage.uarch -o graphs/sb.gv`
3. `neato -Tpdf graphs/sb.gv -o graphs/sb.pdf`

## Design Approach

Check is written in Coq, a theorem prover/verification assistant.  For
example, Coq has been used to rigorously and formally verify mathematical
theorems such as the four color theorem, and it has been used to produce
C compilers which provably produce correct C code.  Check itself does not
yet contain any verified theorems or processes.  Nevertheless, we chose Coq to
make for easier integration with other formal models written using Coq, and to
leave open the possiblity of making Check more rigorous in the future.

In practice, we are also interested in using Check as a practical tool.
For this reason, we auto-extract our code from Coq to OCaml (using built-in
Coq methodology for doing so), and we compile this code to run natively.  So
far, we have not put much effort into optimizing for performance of this code,
partially because of Check's current status as a research tool, but more
importantly because we haven't yet found performance to be a bottleneck.  All
of Check's tests run within a few minutes even without special optimization
effort, and so optimization at this point would likely be premature anyway.

### Status

At this point, Check is a research tool rather than an industry-strength
verification toolchain.  We do appreciate any suggestions or feedback either
in approach or in implementation.  If you are interested in any particular
feature, missing item, or implementation detail, please contact the authors and
we will try to help out as best we can.

Check out our web app!
[Link](http://daniellustig.github.io/coatcheck)

### FAQ

For building the web interface:

Q: ocamlfind: Package `js_of_ocaml.syntax' not found
A: If js_of_ocaml was installed using opam, try:
   eval `opam config env`

Q: I get a bunch of warnings like the following:
   File "Process.ml", line 39, characters 4-122:
   Warning 21: this statement never returns (or has an unsound type.)
A: This is expected behavior within the way we are using js_of_ocaml
