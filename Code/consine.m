function [ kd,km ] = consine( interaction )
    [nd,nm] = size(interaction);
    

    %calculate the consine similarity between disease: kd
    kd = zeros(nd);
    for i = 1:nd
        for j = 1:nd
            kd(i,j) =interaction(i,:)*(interaction(j,:))'/(norm(interaction(i,:))*norm(interaction(j,:)));
        end
    end

    %calculate the consine similarity between lncRNA: km
    km = zeros(nm);
    for i = 1:nm
        for j = 1:nm
            km(i,j) =(interaction(:,i))'*interaction(:,j)/(norm(interaction(:,i))*norm(interaction(:,j)));
        end
    end
end

