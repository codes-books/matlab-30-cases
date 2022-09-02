function ret = Cross(pcross, lenchrom, chrom, sizepop, bound)
%本函数完成交叉操作
% pcorss                input  : 交叉概率
% lenchrom              input  : 染色体的长度
% chrom                 input  : 染色体群
% sizepop               input  : 种群规模
% ret                   output : 交叉后的染色体

% 实数交叉法
for i = 1 : sizepop 
    
    % 随机选择两个染色体进行交叉
    pick = rand(1, 2); % 两个 0-1 之间的随机数
    % 保证二维的pick均不为0
    while prod(pick) == 0 % prod 返回数组元素乘积 
        pick = rand(1, 2);
    end
    index = ceil(pick .* sizepop); % 0 - size 的二维随机整数
    
    % 交叉概率决定是否进行交叉
    pick = rand;
    while pick == 0
        pick = rand;
    end
    if pick > pcross % 通过生成随机数来控制概率
        continue;
    end
    flag = 0;
    while flag == 0
        % 随机选择交叉位置
        pick = rand;
        while pick == 0
            pick = rand;
        end
        % 随机选择进行交叉的位置，即选择第几个变量进行交叉，注意：两个染色体交叉的位置相同
        pos = ceil(pick .* sum(lenchrom));
        pick = rand; % 交叉开始
        v1 = chrom(index(1), pos);
        v2 = chrom(index(2), pos);
        chrom(index(1), pos) = pick * v2 + (1 - pick) * v1;
        chrom(index(2), pos) = pick * v1 + (1 - pick) * v2; % 交叉结束
        flag1 = test(lenchrom, bound, chrom(index(1), :));  % 检验染色体1的可行性
        flag2 = test(lenchrom, bound, chrom(index(2), :));  % 检验染色体2的可行性
        % 如果两个染色体不是都可行，则重新交叉
        if   flag1 * flag2 == 0
            flag = 0;
        else 
            flag = 1;
        end    
    end
end
ret = chrom;
