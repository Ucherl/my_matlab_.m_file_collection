function theta=HW8_b02703009(data)

meanX=mean(data(1,:));
meanY=mean(data(2,:));
%zero adjustment
x=data(1,:)-meanX;
y=data(2,:)-meanY;
[~,n]=size(data);

cov=[x;y;zeros(1,n)];
%disp(cov)

Cov=(1/n)*cov*cov';
disp(Cov);

[lamda,~]=eig(Cov);

% normal_vector=[lamda(1,2),lamda(2,2)];
real_ab=[-lamda(1,2),-lamda(2,2)];
disp(real_ab);

c=-real_ab(1)*meanX-real_ab(2)*meanY;

theta=[real_ab(1) real_ab(2)  c];
disp(theta);
end

