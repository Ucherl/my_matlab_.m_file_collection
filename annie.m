function annie(k)
annie = imread('annie.jpg');
q=8;
[m,n,~]= size(annie);

justatry=[];
for i=1:(m/q)
  for j=1:(n/q)
    temp=reshape(annie(1+q*(i-1):q*i,1+q*(j-1):q*j,:),[],1);
    justatry = [justatry,temp];
  end
end
 % turn to 2 dim matrix
 

justatry = double(justatry+1);
dictionary = kMeansClustering(justatry,k); 
 % build dictionary % k=parameter of center % turn uint8 to double
 
 for i = 1:((m*n)/(q*q))
        matrixA = distPairwise(justatry(:,i), dictionary);
                [~, col_a] =min(matrixA);
        newjustatry(:,i) = dictionary(:, col_a);
 end
  % 4800 = m*n/q*q   assign dictionary to newjustatry
  
annie2=[];
 for i =1:((m*n)/(q*q))
   temp2=reshape(newjustatry(:,i),q,q,3);
   annie2 = [annie2,temp2];
 end
 
 
newannie2=[];
 for i =1:(m/q)
     temp3=annie2(1:q,1+n*(i-1):n*i,:);
     newannie2=[newannie2;temp3];
 end
  % turn dim to 3
 
 newannie2=uint8(newannie2-1);
 % turn to uint8
 
figure;image(newannie2);

end

