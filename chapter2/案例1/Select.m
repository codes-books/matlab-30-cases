function ret = Select(individuals, sizepop)
% 本函数对每一代种群中的染色体进行选择，以进行后面的交叉和变异
% individuals input  : 种群信息
% sizepop     input  : 种群规模
% opts        input  : 选择方法的选择
% ret         output : 经过选择后的种群

% 轮盘赌法
% 基于适应度比例的选择策略

individuals.fitness = 1 ./ (individuals.fitness);
sumfitness = sum(individuals.fitness);
sumf = individuals.fitness ./ sumfitness; % 个体适应度在种群总数中的占比
index = [];
for i = 1 : sizepop   %转sizepop次轮盘
    pick = rand;
    while pick == 0 
        pick = rand;
    end
    for j = 1 : sizepop
        % sumf(j) 越大，被选中的概率越高，但是并不是绝对选择适应度占比最高的个体
        pick = pick - sumf(j);
        if pick < 0
            % 水平合并index j, index 就是所有 j 的水平合并
            index = [index j]; 
            break;  % 寻找落入的区间，此次转轮盘选中了染色体i
            % 注意：在转sizepop次轮盘的过程中，有可能会重复选择某些染色体
        end
    end
end
individuals.chrom = individuals.chrom(index, :);
individuals.fitness = individuals.fitness(index);
ret = individuals;