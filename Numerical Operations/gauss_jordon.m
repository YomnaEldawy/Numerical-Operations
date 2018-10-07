function [result, steps,time] = gauss_jordon(coeffMatrix, constantsMatrix)
tic;
result = NaN;
[m,n] = size(coeffMatrix);
if(m ~= n)
    msgbox("The Matrix must be SQUARE");
    return ;
end
numOfX = length( constantsMatrix);
for i= 1: length(constantsMatrix)
    coeffMatrix(i,length(constantsMatrix)+1) = constantsMatrix(i);
end
ccMatrix = coeffMatrix;
[result, steps] = forwardElimination(ccMatrix, numOfX);
result = backSubstitution(result, numOfX);
time=toc;
end
function [result,steps] =forwardElimination(ccMatrix, numOfX)
answer = ccMatrix;
for pivotIndex=1:numOfX
    pivot= answer(pivotIndex, pivotIndex);
    for col=1:numOfX+1
        answer(pivotIndex, col)= answer(pivotIndex, col)/pivot;
    end
     answer=getStepArray(answer, pivotIndex,col, numOfX);
     steps(:,:,pivotIndex)=answer;
end
result = answer;
end
function array=getStepArray(answer, pivotIndex,col, numOfX)
for row=1:numOfX
    if(pivotIndex == row)
        continue;
    end
    rowPivot=answer(row,pivotIndex);
    for col=1:numOfX+1
        answer(row,col)=answer(row,col) - rowPivot * answer(pivotIndex,col);
    end
end
array=answer;
end
function answer=backSubstitution(result, numOfX)
solution=[0,0];
for i=1:numOfX
    solution(i)=result(i, numOfX+1);
end
answer=solution;
end
