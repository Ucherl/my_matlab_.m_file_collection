function nextPos=myStrategy(gameState, diceValue)
%myStrategy: Strategy for playing the dice sum game
%	Usage: nextPos=myStrategy(gameState, diceValue)
%		gameState: A 4-by-2 matrix indicating the state of the game
%		diceValue: the dice value after tossing the dice
%		nextPos: Your move for placing the dice value.
%			It should be either 1 or 2:
%			1: Place the value at the ten's position
%			2: Place the value at the one's position
%
%	This function is called in diceSumGame.m.

%	Roger Jang, 20101214

tenPosCount=sum(gameState(:,1)==0); % Vacancy count of ten's position
onePosCount=sum(gameState(:,2)==0); % Vacancy count of one's position

if tenPosCount~=0 && onePosCount==0	% Only ten's position is available.
	nextPos=1;
	return
end
if tenPosCount==0 && onePosCount~=0	% Only one's position is available.
	nextPos=2;
	return
end

target=150;	% This is fixed.
% ====== My strategy starts here...
strategy=5;
temp=sum(gameState);
total=10*temp(1)+temp(2);
switch(strategy)

    case 1    % average score=90~92
            if diceValue>3
                nextPos=2;
            else
                nextPos=1;
            end   
    case 2    % average score=99~100
            if diceValue>4
                nextPos=2;
            else
                nextPos=1;
            end
           

    case 3     % average score=100
            if diceValue>4
                nextPos=2;
            elseif 10*temp(1)+temp(2)>120 && diceValue>3
                nextPos=2;
            else
                nextPos=1;                        
            end
    case 4     % average score=99
           if diceValue>4
                nextPos=2;
            elseif 10*temp(1)+temp(2)>110 && diceValue>4
                nextPos=2;
            else
                nextPos=1;                        
           end
      case 5     % average score=100~101
           if diceValue>4
                nextPos=2;
            elseif 10*temp(1)+temp(2)>120 && diceValue>2
                nextPos=2;
            else
                nextPos=1;                        
           end          

end

%%% distribution8=(28,sqrt(18))
%%% distribution4=(14,sqrt(9))
