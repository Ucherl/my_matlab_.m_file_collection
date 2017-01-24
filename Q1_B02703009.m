function output = Q1_B02703009(data,method)
%method 1 linear
x=data(1,:)';
y=data(2,:)';
[~,m]=size(data);
if method ==1
    
    A=[2*x, 2*y, ones(m,1)];
    b=[x.^2+y.^2];
    theta = A\b;
    
    output = [theta(1), theta(2),sqrt(theta(3)+theta(1)^2+theta(2)^2)];
    disp(output);    
end

if method ==2
    A=[2*x, 2*y, ones(m,1)];
    b=[x.^2+y.^2];
    theta = A\b;
    
    initial0 = [theta(1), theta(2),sqrt(theta(3)+theta(1)^2+theta(2)^2)];
    
    theta2=fminsearch(@(theta)myfun(theta,data),initial0);
    output=theta2;
    disp(output);
end

  % local function
    function y=myfun(theta2,data)
         [~,p]=size(data);
         sum=0;
         for i=1:p
             sum = sum + (norm(data(:,i)'-[theta2(1),theta2(2)])-theta2(3) )^2;
         end
         y=sum;
    end

end

