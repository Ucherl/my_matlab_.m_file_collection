function output = Q3_b02703009(A,B)

%UNTITLED Summary of this function goes here

%   Detailed explanation goes here

m = size(A,2);

n = size(B,2);

output = fzero(@sumzero,0);

 

function  output2 = sumzero(x)

sum1=0;
sum2=0;
for i =1:m

    sum1= sum1 + sqrt( (A(1,i)-x)^2 + (A(2,i)-0)^2 );

end

for j =1:n

    sum2= sum2 + sqrt( (B(1,j)-x)^2+ (B(2,j)-0)^2);

end

output2 = sum1-sum2;

end

end

