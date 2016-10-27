function output = Q3_b02703009 (A, B)

output =fzero(@sumzero, 0);

function output2 = sumzero(x)

output2 =( (A(1,:).*1-x)^2 + A(2,:).^2  )^(1/2) - ( (B(1,:).*1-x)^2 + B(2,:).^2  )^(1/2);

end

end