function [S] = updateS(viewWeight, mvMatrix, F, lambda)
% this function is to update SL and SD

    num = size(mvMatrix{1}, 1);
    viewNum = size(viewWeight, 1);
     
    S = zeros(num); % S is the optimal matrix to be learned         
    distd = L2_distance_1(F', F');
    
    for i = 1:num
        a0 = zeros(1, num);
        for v = 1:viewNum
            temp = mvMatrix{v};
            a0 = a0 + viewWeight(v, 1) * temp(i, :);
        end
        %a0 Represents the v weight times the i row of the v view, summed over v
        idxa0 = find(a0 > 0);
        % idxa0 = 1:num;
        ai = a0(idxa0);
        di = distd(i, idxa0);         
        %ad = (ai - 0.5 * lambda * di) / sum(viewWeight);
        ad = ai - 0.5 * lambda * di;
        S(i, idxa0) = EProjSimplex_new(ad);
    end
end


   