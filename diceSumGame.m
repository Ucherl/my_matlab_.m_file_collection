function score=diceSumGame(showInfo)
%diceSumGame: Game of dice sum
%	Usage: score=diceSumGame(showInfo)
%		showInfo: 1 for printing some statistics of the game.

%	Roger Jang, 20101214

if nargin<1, showInfo=0; end
target=150;

gameState=zeros(4,2);
diceValue=zeros(1,8);
for i=1:8
	diceValue(i)=randi(6);
	nextPos=myStrategy(gameState, diceValue(i));
	% === Check if the next position is legal
	if (nextPos~=1) && (nextPos~=2)
		score=0;
		return;
	end
	if (sum(gameState(:,1)==0)==0) && (nextPos==1)
		score=0;
		return;
	end
	if (sum(gameState(:,2)==0)==0) && (nextPos==2)
		score=0;
		return;
	end
	index=find(gameState(:,nextPos)==0);		% Find available positions
	gameState(index(1), nextPos)=diceValue(i);	% Put the dice value
	% === Check if the total explodes
	temp=sum(gameState); total=10*temp(1)+temp(2);
	if total>target
		break;
	end
end

if total<=target
	score=total;
else
	score=0;
end

if showInfo
	fprintf('dice values = %s\n', mat2str(diceValue));
	fprintf('gameState:\n');
	disp(gameState);
	fprintf('Total=%d\n', total);
	fprintf('Score=%d\n', score);
end   
end

