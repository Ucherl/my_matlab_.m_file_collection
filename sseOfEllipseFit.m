function [sse,theta]=sseOfEllipseFit(data,showPlot)
   
%initial center guess    
center0=mean(data);
%get center first by fminsearch(nonlinear)
center = fminsearch(@(c)errorFOR(c,data),center0);

%local function 
    function [sse, radius]= errorFOR (center,data)
    [m_2,~]=size(data); 
        
    A_2=[( data(:,1)-center(1)).^2  ( data(:,2)-center(2)).^2];
    Y_2=[ones(m_2,1)];    
    theta_2 = A_2\Y_2;   

    rr_2 =[theta_2(1),theta_2(2)];
    real_rr_2 = [sqrt(1/rr_2(1)) sqrt(1/rr_2(2))];  
    
    error_2=0;
      for j =1:m_2
        error_2=error_2 +(  ((data(j,1)-center(1))/real_rr_2(1))^2+((data(j,2)-center(2))/real_rr_2(2))^2-1 )^2;      
      end
    
    sse=error_2;
    radius = real_rr_2; 
    
    end

%get radius by lse
    [m,~]=size(data); 
        
    A=[( data(:,1)-center(1)).^2  ( data(:,2)-center(2)).^2];
    Y=[ones(m,1)];    
    theta = A\Y;   

    rr =[theta(1),theta(2)];
    real_rr = [sqrt(1/rr(1)) sqrt(1/rr(2))];  
    
    error=0;
    for i =1:m
        error=error +(  ((data(i,1)-center(1))/real_rr(1))^2+((data(i,2)-center(2))/real_rr(2))^2-1 )^2;      
    end
    
    %ans
    sse=error;
    theta=[center real_rr];

   
    
if showPlot==1
    plot(data(:,1), data(:,2), 'ro');   
end

end    

