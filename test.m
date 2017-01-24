function test

testNum=10000;
score=zeros(1, testNum);
tic
for i=1:testNum
	score(i)=diceSumGame;
end
time=toc;
fprintf('testNum = %d, time = %.2f sec\n', testNum, time);
%fprintf('score = %s\n', mat2str(score));
fprintf('No. of explosions = %d\n', sum(score==0));
fprintf('No. of non-explosions = %d (average = %f)\n', sum(score~=0), sum(score)/sum(score~=0));
fprintf('Score average = %f\n', mean(score));

end