function bestOrder = polyOrderSelect(data,maxOrder)

[m,~]=size(data);
meanX=mean(data);
stdX=std(data);

data(:,1)=(data(:,1)-meanX(1))/stdX(1);
%data(:,2)=(data(:,2)-meanX(2))/stdX(2);
%normalizes
    
training_plot=[];
validating_plot=[];
    
rmse=[];
rmse2=[];
    
  for i=1:maxOrder

    for j=1:m
        validate_set=data(j,:);
        train_data=data;
        train_data(j,:)=[];
        
        theta=polyfit(train_data(:,1),train_data(:,1),i);
        yhat=polyval(theta,train_data(:,1));
        
        error=transpose(train_data(:,2)-yhat)*(train_data(:,2)-yhat);
        rmse=[rmse,error];

        yhat2=polyval(theta,validate_set(1,1));
        error2= (validate_set(1,2)-yhat2)^2;
        
        rmse2=[rmse2,error2];
        
   end
% disp(rmse)
% disp(rmse2)
        training_error=sqrt (sum(rmse)/m);
        validating_error= sqrt(sum(rmse2)/m);
        
     training_plot=[training_plot,training_error];
    validating_plot=[validating_plot,validating_error];
    disp(training_plot)
  end
 % plot(1:maxOrder,training_plot,1:maxOrder,validating_plot);
 % hold on
 % set(gca, 'yscale', 'log');
 % hold off
end

