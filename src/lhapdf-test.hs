module Main where

import HEP.Data.LHAPDF (mkPDF, alphasQ)

main :: IO ()
main = do
    pdf <- mkPDF "NNPDF23_lo_as_0130_qed"
    let mZ = 91.1876
    alphas <- alphasQ pdf mZ
    putStrLn $ "\\alpha_s(m_Z) = " ++ show alphas
