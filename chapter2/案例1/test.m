function flag = test(~, bound,code)
% 用于检验染色体的可行性

% lenchrom(~)input : 染色体长度
% bound      input : 变量的取值范围
% code       output: 染色体的编码值

% 对于定义或存在但是未被使用的变量命令为 ~

flag = 1;
[n,~] = size(code);

for i = 1:n
    if code(i) < bound(i,1) || code(i) > bound(i,2)
        flag = 0;
    end
end