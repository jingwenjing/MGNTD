clear;
clc;
load('USPS_11000_16x16.mat')
fea=fea1;   
fea1=NormalizeFea(fea);  
MK=1100;nk=10; 
opt=[];    r=0.10;
opt.eps=1e-8; 
opt.Maxiter=50;%100
opt.lambda=1e7;
opt.beta=1e8;   
NKN=1;   iter=1; 
Y=fea; 
[n3,~]=size(Y);
TY=reshape(Y',[16,16,n3]);
TY=tensor(TY);    n=size(TY); 
m1=2;m2=2;m3=nk;
options = [];    %构造图
       options.NeighborMode = 'KNN';
       options.k = 1; 
       options.WeightMode = 'Binary';
       LS2= constructW(fea,options); 
options1 = [];   %构造图
       options1.NeighborMode = 'KNN';
       options1.k = 4; 
       options1.WeightMode = 'Binary';
       LS1= constructW(fea1,options1);
       LS=LS1+LS2;
rng('default')
for j1=1:iter 
    [PY,c]=xuanY(nk,MK,r); 
    G=tenrand(m1,m2,m3);   
    U=rand(n(1),m1)*1000;V=rand(n(2),m2)*1000;W=rand(n(3),m3)*1;
    PV=zeros(size(W));  
    [G,U,V,W,nuiter]=MGSNTD1(TY,G,U,V,W,LS,PY,PV,c,opt);
for k1=1:NKN
    labels = kmeans(W,nk,'Replicates',50);
    labels = bestMap(gnd1,labels); 
    AC= length(find(gnd1 == labels))/length(gnd1);
    ACiter(j1,k1)=AC;   
end
end     
meanAC_MGSNTD=mean(mean(ACiter)); 
stdAC_MGSNTD=std2(ACiter);      





