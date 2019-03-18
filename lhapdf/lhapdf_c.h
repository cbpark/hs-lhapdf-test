#ifndef LHAPDF_C_H_
#define LHAPDF_C_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef struct CPDF CPDF;

CPDF *mkPDF(const char *setname);

double alphasQ(CPDF *pdf, double q);

void rmPDF(CPDF *pdf);

#ifdef __cplusplus
}
#endif

#endif  // LHAPDF_C_H_
