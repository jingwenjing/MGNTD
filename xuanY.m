function [Y,c] = xuanY(k,M,r)%标签矩阵
% k：类别总数
% M：每个类别中的样本总数
% r：所选比例
p=round(M*r); 
Q=zeros(k,M*k);
c=[];
for t=1:k
    b=M*(t-1)*ones(1,p)+randperm(M,p);
    c=[c b];  %选出来的样本的全部序号
    for i=1:p
        Q(t,b(i))=1;
    end
end
Y=Q';
Y= sparse(Y); 
end

