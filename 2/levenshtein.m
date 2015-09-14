function [dist,L] = levenshtein(str1,str2)
    L1=length(str1)+1;
    L2=length(str2)+1;
    L=zeros(L1,L2);

    g=1;
    m=0;
    d=1;
    
    L(:,1)=(0:(L1-1)*g)';
    L(1,:)=0:(L2-1)*g;
    
    for x=2:L1;
        for y=2:L2
            if(str1(x-1)==str2(y-1))
                score=m;
            else
                score=d;
            end
            m1=L(x-1,y-1) + score;
            m2=L(x-1,y) + g;
            m3=L(x,y-1) + g;
            L(x,y)=min(m1,min(m2,m3));
        end
    end
    
    dist=L(L1,L2);
end