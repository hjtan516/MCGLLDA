function [SL, SD, F] = alternativeUpdate(ALweight, AL, ADweight, AD, Y, ...
                                 alpha, beta, gamma)

    NITER = 50;
    thresh = 10^-10;
    
    F_old = Y;
    F = Y;
    SL = zeros(size(AL{1}));
    SD = zeros(size(AD{1}));
    
    for iter = 1:NITER
        %% update S 
        SL = updateS(ALweight, AL, F, alpha);
        SD = updateS(ADweight, AD, F', beta);
        
        %% fix SM and SD, update F
        SL0 = SL - diag(diag(SL));
        SL1 = (SL0 + SL0') / 2; % in case the similarity matrix is not symmetric
        DL = diag(sum(SL1));
%         LSM = DM - SM1;
        idL = eye(size(SL1, 1));
        
        SL2 = diag(1 ./ (diag(sqrtm(DL+eps*eye(size(DL))))));
        LSL = idL - SL2 * SL1 * SL2;
        
        SD0 = SD - diag(diag(SD));
        SD1 = (SD0 + SD0') / 2; % in case the similarity matrix is not symmetric
        DD = diag(sum(SD1));
%         LSM = DM - SM1;
        idD = eye(size(SD1, 1));
        SD2 = diag(1 ./ diag(sqrtm(DD+eps)));
        LSD = idD - SD2 * SD1 * SD2;

        F = sylvester(2 * alpha * LSL + gamma * idL, 2 * beta * LSD, gamma * Y);
        
        diff = abs(sum(sum(abs(F) - abs(F_old))));
        if diff < thresh
            break;
        end
        
        F_old = F;
        
    end
    
end