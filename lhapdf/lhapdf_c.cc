#include "lhapdf_c.h"
#include <string>
#include "LHAPDF/LHAPDF.h"

using namespace LHAPDF;

extern "C" {
CPDF *mkPDF(const char *setname) {
    PDF *pdf = mkPDF(std::string(setname));
    return reinterpret_cast<CPDF *>(pdf);
}

double alphasQ(CPDF *pdf, double q) {
    PDF *pdf_c = reinterpret_cast<PDF *>(pdf);
    return pdf_c->alphasQ(q);
}

void rmPDF(CPDF *pdf) {
    PDF *pdf_c = reinterpret_cast<PDF *>(pdf);
    delete pdf_c;
}
}
