function output = Q2_B02703009(data)
[~,m]=size(data);

w=[];
for i =1:m
    w=[w,sum(data(:,i).^2)];
end
disp(w);
A=w*[2*data(1,:).*data(4,:), 2*data(2,:).*data(4,:),2*data(3,:).*data(4,:), data(1,:).^2, data(2,:).^2, data(3,:).^2, 2*data(1,:).*data(2,:),2*data(1,:).*data(3,:),2*data(2,:).*data(3,:)];
disp(A);
b=w*[data(4,:).^2];

theta=A\b;

disp(theta);

output = [theta(1),theta(2),theta(3)];
end

