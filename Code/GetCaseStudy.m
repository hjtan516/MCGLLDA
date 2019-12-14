function [F] = GetCaseStudy(AL, AD, Y)
    
    % compute the Gaussian Interaction Profile
    [KD, KL] = GaussianKernel(Y', 1, 1);
    
    % set the diagonal elements to 0
    KL(logical(eye(size(KL)))) = 0;
    KD(logical(eye(size(KD)))) = 0;
    
   %Multiple View
    AL(size(AL, 2) + 1) = {KL};
    AD(size(AD, 2) + 1) = {KD};
    
    %compute the consine similarity
    [KD, KL] = consine(Y');
    KL(logical(eye(size(KL)))) = 0;
    KD(logical(eye(size(KD)))) = 0;
    AL(size(AL, 2) + 1) = {KL};
    AD(size(AD, 2) + 1) = {KD};
    F = MultiViewPrediction(AL, AD, Y);
    
end