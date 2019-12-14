function [ kd,kl ] = consine( interaction )
    [nd,nl] = size(interaction);
    

    %calculate the consine similarity between disease: kd
    kd = zeros(nd);
    for i = 1:nd
        for j = 1:nd
            kd(i,j) =interaction(i,:)*(interaction(j,:))'/(norm(interaction(i,:))*norm(interaction(j,:)));
        end
    end

    %calculate the consine similarity between lncRNA: km
    kl = zeros(nl);
    for i = 1:nl
        for j = 1:nl
            kl(i,j) =(interaction(:,i))'*interaction(:,j)/(norm(interaction(:,i))*norm(interaction(:,j)));
        end
    end
end

