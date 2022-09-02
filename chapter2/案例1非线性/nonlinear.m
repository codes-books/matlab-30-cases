function ret = nonlinear(chrom, sizepop)

ret = zeros([sizepop, size(chrom,2)]); %  初始化以提高运算速度
for i = 1:sizepop
    % 最开始用 inline 实现，
    % 但是matlab推荐用匿名函数实现，并准备后续删掉inline
    % x = fmincon(inline('-5*sin(x(1))*sin(x(2))*sin(x(3))*sin(x(4))*sin(x(5))-sin(5*x(1))*sin(5*x(2))*sin(5*x(3))*sin(5*x(4))*sin(5*x(5))'),chrom(i,:)',[],[],[],[],[0 0 0 0 0],[2.8274 2.8274 2.8274 2.8274 2.8274]);
    x = fmincon(...
        @(x) -5*sin(x(1))*sin(x(2))*sin(x(3))*sin(x(4))*sin(x(5))-sin(5*x(1))*sin(5*x(2))*sin(5*x(3))*sin(5*x(4))*sin(5*x(5)),...
        chrom(i,:)',...
        [],[],...
        [],[],...
        [0 0 0 0 0],[2.8274 2.8274 2.8274 2.8274 2.8274]);
    ret(i, :) = x';
end



