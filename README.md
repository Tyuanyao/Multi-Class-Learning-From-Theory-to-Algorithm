# Multi-Class Learning: From Theory to Algorithm
## Links
[[PDF]](https://superlj666.github.io/files/mc.pdf)
[[Code]](https://github.com/superlj666/Multi-Class-Learning-From-Theory-to-Algorithm)
[[Poster]](https://superlj666.github.io/files/mc-lrc-nips-poster.pdf)
[[Slide]](https://superlj666.github.io/files/mc-lrc-nips-slides.pdf)
[[3-minute video]](https://youtu.be/mE_RpgWuKK8)
## Supplementary file
Appendixes mentioned in the paper are attached in MC-supplementary.pdf
## Usage of source code
Code used in experiments locates in ./code
### Enviroment
We do experiments based on following softwares:
1. Python 2.7
2. MATLAB R2017b
3. DOGMA toolbox from http://dogma.sourceforge.net/
4. SHOGUN-6.1.3 from https://github.com/shogun-toolbox/shogun
5. LIBSVM Tools from https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/
6. sklearn for python
### Data sets
1. plant, psortPos, psortNeg and nonpl from http://www.raetschlab.org/suppl/protsubloc
2. others from https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/
### Steps
1. Download data sets and move dataName.phylpro.mat, label_dataName.mat and dataName.scale to code/data/
2. Create Gaussian kernels: change variable file_list in Test_Gaussian_Kernel.m and run
3. Run following methods
- SMSD-MKL: change variables of data_sets in Test_SMSD_MKL.m and run
- Conv-MKL: change variables of data_sets in Test_Conv_MKL.m and run
- LMC: change variables of data_sets in Test_LMC.py and run
- OneVsOne: change variables of data_sets in Test_OneVsOne.m and run
- OneVsRest: change variables of data_sets in Test_OneVsOne.m and run
- GMNP: change variables of data_sets in Test_GMNP.py and run
- l1 MC-MKL: change variables of data_sets in Test_MC_MKL_1.py and run
- l2 MC-MKL: change variables of data_sets in Test_MC_MKL_2.py and run
- UFO-MKL: change variables of data_sets in Test_UFO_MKL.m and run
