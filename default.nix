{ mkDerivation, base, lhapdf, stdenv }:
mkDerivation {
  pname = "hs-lhapdf-test";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  executableSystemDepends = [ lhapdf lhapdf.pdf_sets.NNPDF23_lo_as_0130_qed ];
  description = "Test for the haskell FFI to use LHAPDF";
  license = stdenv.lib.licenses.bsd3;
}
