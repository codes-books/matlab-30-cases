function ret = Code(lenchrom, bound)
%�����������������Ⱦɫ�壬���������ʼ��һ����Ⱥ
% lenchrom   input : Ⱦɫ�峤��
% bound      input : ������ȡֵ��Χ
% ret        output: Ⱦɫ��ı���ֵ

% ʵ�����벻�ؽ�����ֵת��������ֱ���ڽ�ı������Ͻ����Ŵ��㷨����
% �ڱ����У�ÿһ��Ⱦɫ��Ϊһ��ʵ������

flag = 0;
while flag == 0 
    pick = rand(1,length(lenchrom));
    ret = bound(:,1)' + (bound(:,2) - bound(:,1))' .* pick; %���Բ�ֵ
    % flag = 1 ��ʱ��֤��Ⱦɫ����в�����
    flag = test(lenchrom, bound, ret);             %����Ⱦɫ��Ŀ�����
end