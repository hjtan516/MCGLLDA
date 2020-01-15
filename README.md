# MCGLLDA

Multiview Consensus Graph Learning for LncRNA-Disease Association Prediction.
Please read User_Manual.pdf file for more details.

**Method Description**

MCGLLDA is a novel method based on multiview consensus graph learning to predict the lncRNA-disease associations. It overcome some of the limitations of the existing methods such as averaging the input similarity information and took fully advantage of the existing information to obtain a superior prediction. First, it constructed a set of similarity matrices for lncRNAs and diseases in terms of the known lncRNA-disease associations. Then it learned a consensus graph for lncRNAs and disease from the multiple similarity matrices and obtained the association probability between lncRNAs and disease. The experimental results show that the proposed method can obtain the best performance effect compared with state-of-the-art methods.

**Requirements**

MCGLLDA was developed in MATLAB 2014b environment, but it should be working in all MATLAB versions. 

**Usage**

We provided a functions, case study for users. To run the case study, please load the script 'main.m' into your MATLAB programming environment and click 'run'. 

All the datasets used in the code are all provided in the corresponding 'datasets/*.mat'.


**Parameters**

There are two parameters alpha and beta in MCGLLDA. The default value of alpha is 0.001 and beta is 0.0001. Users can change their value in "MultiViewPrediction.m" file.

**Output**

The default output directory of MCGLLDA is under the same directory where the scripts locate and it can be changed in the 'caseStudy.m' file accordingly. All the results are stored in 'mat' file for convenience.
