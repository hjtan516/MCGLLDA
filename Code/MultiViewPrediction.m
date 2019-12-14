function [F] = MultiViewPrediction(AL, AD, Y)

% AD£ºthe multi-view disease-disease similarity matrix
% AL: the multi-view lncRNA-lncRNA similarity matrix
% Y : the ground truth (the known lncRNA-disease associations)
% F : the result predicted by our method

    ALview = size(AL, 2);
    ADview = size(AD, 2);
    
   %% initialize the weights of each view for both lncRNAs and diseases 
    ALWeight = 1 / ALview * ones(ALview,1 );
    ADweight = 1 / ADview * ones(ADview,1 );

    
    alpha = 0.001;  
    beta = 0.0001;
    gamma = 1;

    NITER = 15;
    thresh = 10^-12;      % Iterative terminating condition
    
    %%  Iteration
    for iter = 1:NITER
        
        %% update SL, SD and F;
        [SL, SD, F] = alternativeUpdate(ALWeight, AL, ADweight, AD, Y, ...
                            alpha, beta, gamma);
        
        %% update view weights and calculate obj;
        obj = 0;
        for v = 1:ALview
            curValue = norm(SL - AL{v}, 'fro');
            %AMweight(v, 1) = 0.5 / curValue;
            obj = obj + curValue;
        end
        
        for v = 1:ADview
            curValue = norm(SD - AD{v}, 'fro');
            %ADweight(v, 1) = 0.5 / curValue;
            obj = obj + curValue;
        end
        
        
        ALWeight=updateW(SL,AL);
        ADweight=updateW(SD,AD);
        %% obj
        obj = obj + norm(F - Y, 'fro');
        Obj(iter) = obj;
        
        if(iter > 1 && abs(Obj(iter - 1) - Obj(iter)) < thresh)
            fprintf('Iteration stops at %d step.\n', iter);
            break;
        end
    end


end


   