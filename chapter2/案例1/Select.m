function ret = Select(individuals, sizepop)
% ��������ÿһ����Ⱥ�е�Ⱦɫ�����ѡ���Խ��к���Ľ���ͱ���
% individuals input  : ��Ⱥ��Ϣ
% sizepop     input  : ��Ⱥ��ģ
% opts        input  : ѡ�񷽷���ѡ��
% ret         output : ����ѡ������Ⱥ

% ���̶ķ�
% ������Ӧ�ȱ�����ѡ�����

individuals.fitness = 1 ./ (individuals.fitness);
sumfitness = sum(individuals.fitness);
sumf = individuals.fitness ./ sumfitness; % ������Ӧ������Ⱥ�����е�ռ��
index = [];
for i = 1 : sizepop   %תsizepop������
    pick = rand;
    while pick == 0 
        pick = rand;
    end
    for j = 1 : sizepop
        % sumf(j) Խ�󣬱�ѡ�еĸ���Խ�ߣ����ǲ����Ǿ���ѡ����Ӧ��ռ����ߵĸ���
        pick = pick - sumf(j);
        if pick < 0
            % ˮƽ�ϲ�index j, index �������� j ��ˮƽ�ϲ�
            index = [index j]; 
            break;  % Ѱ����������䣬�˴�ת����ѡ����Ⱦɫ��i
            % ע�⣺��תsizepop�����̵Ĺ����У��п��ܻ��ظ�ѡ��ĳЩȾɫ��
        end
    end
end
individuals.chrom = individuals.chrom(index, :);
individuals.fitness = individuals.fitness(index);
ret = individuals;