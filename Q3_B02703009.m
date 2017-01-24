function output = Q3_B02703009(data)
% data=(d*w) generate d+1 output
[~,n]=size(data);
%zero adjustment
meanD=mean(data');
%disp(meanD);
newdata=[];
for i =1:n
    newdata=[newdata,data(:,i)-meanD'];   
end


cov =(1/n)*newdata*newdata';

%disp(cov);

[VEC,lamda]=eig(cov);
disp(lamda);
disp(VEC);

lamda_new=sum(lamda);
[finding,indice]=min(lamda_new);

normal_vector=VEC(:,indice);
%disp(normal_vector);
real_vector=normal_vector;

temp_e=real_vector'*meanD';
e=-temp_e;

output=[real_vector',e];
disp(output);
% normal_vector=[lamda(1,2),lamda(2,2)];
end

