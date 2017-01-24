function output = polygetrmse(D,maxorder,yesplot)

% rmse(f,D)= sum | yi-y |^2
% f=polyfit (D, order)

%for order
%validating rmse = rmse (f, (x,y) )
%training rmse= rmse(f, D-(x,y))
%f = polyfit(D-(x,y), order)
%由於（x,y）iterate n 遍，將有 n 個 validating ＆ training

% sum validating rmse/n
% sum training rmse/n

%this is the answer for each order
[n,~]=size(D);
MEAN= mean(D(:,1));
STD= std(D(:,1));
D(:,1)=( D(:,1)-MEAN )/STD;

rmse_validate_plot=[];
rmse_training_plot=[];
for k=1:maxorder
    val_validate=[];
    val_training=[];

for i =1:n
    leave_one = D(i,:);
    model_set = D;
    model_set(i,:)=[];
    
    f=polyfit(model_set(:,1),model_set(:,2),k);
    
    validating_rmse=(leave_one(1,2)-polyval(f,leave_one(1,1)) )^2;
    training_rmse= transpose(model_set(:,2)-polyval(f,model_set(:,1)))*(model_set(:,2)-polyval(f,model_set(:,1)));
    
    val_validate=[val_validate; validating_rmse];
    val_training=[val_training;training_rmse];

end

    rmse_validate=sum(val_validate)/n;
    rmse_training=sum(val_training)/n^2;
    
    rmse_validate=sqrt(rmse_validate);
    rmse_training=sqrt(rmse_training);
    
    rmse_validate_plot=[rmse_validate_plot; rmse_validate];
    rmse_training_plot=[rmse_training_plot,rmse_training];
end
    find_the_min=min(rmse_validate_plot);  
    [~,ww]=min(rmse_validate_plot);
    output=ww;
    
if yesplot==1   
    plot(1:maxorder,rmse_validate_plot,1:maxorder,rmse_training_plot);
    hold on
    plot(ww,find_the_min,'o');
    set(gca, 'yscale', 'log');
    legend('show')
else
    fprintf('enter 1 behind data and maxorder');
end


end

%%validaing is correct
%%trainging sum(val_training)/n^2......why???
