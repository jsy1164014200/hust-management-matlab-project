function [a,b] = getMin1(A)
% getMin0 得到Monge矩阵A中的最小元素的坐标
% 
% 输入
%    A：矩阵
% 输出
%    a：行索引
%    b：列索引


% 为了减少矩阵的大小，选择第一行，第一列最小元素的 最大索引为开始迭代。
beginCIndex = find( A(1,:) == min(A(1,:)) );
beginCIndex = beginCIndex(end);
beginRIndex = find( A(:,1) == min(A(:,1)) );
beginRIndex = beginRIndex(end);
% beginA存放最后形成的小矩阵。
beginA = A(beginRIndex:end,beginCIndex:end);
while true 
    nextCIndex = find( beginA(1,:) == min(beginA(1,:)) );
    nextCIndex = nextCIndex(end);
    nextRIndex = find( beginA(:,1) == min(beginA(:,1)) );
    nextRIndex = nextRIndex(end);
    % 如果第一个元素就是第一行第一列最小的元素，就结束迭代
    if nextCIndex == 1 && nextRIndex == 1
        break
    else
        beginRIndex = beginRIndex + nextRIndex - 1;
        beginCIndex = beginCIndex + nextCIndex - 1;
        beginA = beginA(nextRIndex:end,nextCIndex:end);
    end
end

[r,c] = getMin0(beginA);
a = beginRIndex + r -1;
b = beginCIndex + c -1;
end