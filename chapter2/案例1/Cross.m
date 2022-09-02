function ret = Cross(pcross, lenchrom, chrom, sizepop, bound)
%��������ɽ������
% pcorss                input  : �������
% lenchrom              input  : Ⱦɫ��ĳ���
% chrom                 input  : Ⱦɫ��Ⱥ
% sizepop               input  : ��Ⱥ��ģ
% ret                   output : ������Ⱦɫ��

% ʵ�����淨
for i = 1 : sizepop 
    
    % ���ѡ������Ⱦɫ����н���
    pick = rand(1, 2); % ���� 0-1 ֮��������
    % ��֤��ά��pick����Ϊ0
    while prod(pick) == 0 % prod ��������Ԫ�س˻� 
        pick = rand(1, 2);
    end
    index = ceil(pick .* sizepop); % 0 - size �Ķ�ά�������
    
    % ������ʾ����Ƿ���н���
    pick = rand;
    while pick == 0
        pick = rand;
    end
    if pick > pcross % ͨ����������������Ƹ���
        continue;
    end
    flag = 0;
    while flag == 0
        % ���ѡ�񽻲�λ��
        pick = rand;
        while pick == 0
            pick = rand;
        end
        % ���ѡ����н����λ�ã���ѡ��ڼ����������н��棬ע�⣺����Ⱦɫ�彻���λ����ͬ
        pos = ceil(pick .* sum(lenchrom));
        pick = rand; % ���濪ʼ
        v1 = chrom(index(1), pos);
        v2 = chrom(index(2), pos);
        chrom(index(1), pos) = pick * v2 + (1 - pick) * v1;
        chrom(index(2), pos) = pick * v1 + (1 - pick) * v2; % �������
        flag1 = test(lenchrom, bound, chrom(index(1), :));  % ����Ⱦɫ��1�Ŀ�����
        flag2 = test(lenchrom, bound, chrom(index(2), :));  % ����Ⱦɫ��2�Ŀ�����
        % �������Ⱦɫ�岻�Ƕ����У������½���
        if   flag1 * flag2 == 0
            flag = 0;
        else 
            flag = 1;
        end    
    end
end
ret = chrom;
