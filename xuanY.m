function [Y,c] = xuanY(k,M,r)%��ǩ����
% k���������
% M��ÿ������е���������
% r����ѡ����
p=round(M*r); 
Q=zeros(k,M*k);
c=[];
for t=1:k
    b=M*(t-1)*ones(1,p)+randperm(M,p);
    c=[c b];  %ѡ������������ȫ�����
    for i=1:p
        Q(t,b(i))=1;
    end
end
Y=Q';
Y= sparse(Y); 
end

