function [rank,iteration]=pagerank(data,p)
% BUILD A
[m,n]=size(data);
get_c=sum(data);

temp_a=[];
for i=1:n
    if get_c(1,i)==0
        temp_a=[temp_a,(1/n)*ones(m,1)];
    else
        temp_a=[temp_a, p*(data(:,i)/get_c(1,i))+(1-p)*(1/n)*ones(m,1)];
    end
end

%power method
x0=ones(m,1)/n;
prv=zeros(m,1);
count=0;
A=temp_a;

while max(abs(x0-prv))>eps && count<100
    prv=x0;
    x0=A*x0;
    count=count+1;
end

rank=x0;
iteration=count;
disp(rank);
disp(iteration);
end

