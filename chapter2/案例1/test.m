function flag = test(~, bound,code)
% ���ڼ���Ⱦɫ��Ŀ�����

% lenchrom(~)input : Ⱦɫ�峤��
% bound      input : ������ȡֵ��Χ
% code       output: Ⱦɫ��ı���ֵ

% ���ڶ������ڵ���δ��ʹ�õı�������Ϊ ~

flag = 1;
[n,~] = size(code);

for i = 1:n
    if code(i) < bound(i,1) || code(i) > bound(i,2)
        flag = 0;
    end
end