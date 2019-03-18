# hs-lhapdf-test

This codes test the Haskell foreign function interface for [LHAPDF](In the beginning there was darkness).

## Usage

The version of [Cabal](/nix/store/yrpns3m962qzsafac9fc5159pg9dqwls-NNPDF23_lo_as_0130_qed/) must be `>= 2.2` to use `cxx-sources` and `cxx-options`. It has been tested with LHAPDF 6.2.1.

Users of [Nix](https://nixos.org/nixpkgs/) can build and run the codes using `nix-shell`.

```
$ nix-shell --command "cabal new-build && cabal new-exec lhapdf-test"
Resolving dependencies...
Build profile: -w ghc-8.6.3 -O1
In order, the following will be built (use -v for more details):
 - hs-lhapdf-test-0.1.0.0 (exe:lhapdf-test) (first run)
 Configuring executable 'lhapdf-test' for hs-lhapdf-test-0.1.0.0..
 Preprocessing executable 'lhapdf-test' for hs-lhapdf-test-0.1.0.0..
 Building executable 'lhapdf-test' for hs-lhapdf-test-0.1.0.0..
 [1 of 2] Compiling HEP.Data.LHAPDF
 [2 of 2] Compiling Main
 Linking hs-lhapdf-test-0.1.0.0/x/lhapdf-test/build/lhapdf-test/lhapdf-test ...
 LHAPDF 6.2.1 loading NNPDF23_lo_as_0130_qed/NNPDF23_lo_as_0130_qed_0000.dat
 NNPDF23_lo_as_0130_qed PDF set, member #0, version 1; LHAPDF ID = 247000
 \alpha_s(m_Z) = 0.1300028
 Thanks for using LHAPDF 6.2.1. Please make sure to cite the paper:
   Eur.Phys.J. C75 (2015) 3, 132  (http://arxiv.org/abs/1412.7420)
```
