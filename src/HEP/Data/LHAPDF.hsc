{-# LANGUAGE CPP #-}

module HEP.Data.LHAPDF (mkPDF, alphasQ, PDF) where

import Foreign.C.String      (CString, newCString)
import Foreign.C.Types       (CDouble (..))
import Foreign.ForeignPtr    (ForeignPtr, newForeignPtr, withForeignPtr)
import Foreign.Marshal.Alloc (finalizerFree)
import Foreign.Ptr           (Ptr)

#include "lhapdf_c.h"

-- type CPDF = Ptr ()
newtype CPDF = CPDF (Ptr CPDF)
-- newtype PDF = PDF (ForeignPtr ())
newtype PDF = PDF (ForeignPtr CPDF)

foreign import ccall "mkPDF" c_mkPDF :: CString -> IO CPDF

-- mkPDF :: String -> IO CPDF
-- mkPDF setname = newCString setname >>= c_mkPDF

mkPDF :: String -> IO PDF
mkPDF setname = do
    CPDF cpdf <- newCString setname >>= c_mkPDF
    pdf <- newForeignPtr finalizerFree cpdf
    return (PDF pdf)

foreign import ccall "alphasQ" c_alphasQ :: CPDF -> CDouble -> IO CDouble

-- alphasQ :: CPDF -> Double -> IO Double
-- alphasQ pdf q = c_alphasQ pdf (realToFrac q) >>= return . realToFrac

alphasQ :: PDF -> Double -> IO Double
alphasQ (PDF pdf) q =
    withForeignPtr
        pdf
        (\p -> realToFrac <$> c_alphasQ (CPDF p) (realToFrac q))

-- foreign import ccall "rmPDF" rmPDF :: CPDF -> IO ()
