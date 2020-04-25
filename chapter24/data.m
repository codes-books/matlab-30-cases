clc
clear

h=[2000         800         500        1000         900         700        1100        1000        1300        1200        1500
   200         600         600        1200        1500         600         600        1100        1300        1600        1400
         700         500         600         500         300         600         600         600         600        1100        1500
         300         600         600         600         400         600         800         600         600         600        1400
         800         400         600        1700         900        1000         400        1700        1800         900         600
         500         700         800        1600         900        1600        2100        1700         900        1200        1100
         300           0         900        1500        1000        1400         1900        2100        1200         600        1800
         900        1100        1000        1700        1600        1200        1600         900        1600        1100        1300
         600         800         700         600         800        1600         900        1100        1000         600         900
         900         800         600         900         800         800         800        1100         600        1400        1300
         600         900        1100         800         800         600         900        1200         600        1100         600];


for i=1:11
    for j=1:11
        h1(2*i-1,j)=h(i,j);
    end
end

for i=1:10
    for j=1:11
        h1(2*i,j)=(h1(2*i-1,j)+h1(2*i+1,j))/2;
    end
end

for i=1:21
    for j=1:11
        h2(i,2*j-1)=h1(i,j);
    end
end

for i=1:21
    for j=1:10
        h2(i,2*j)=(h2(i,2*j-1)+h2(i,2*j+1))/2;
    end
end

z=h2;      %   ��ʼ����
x=1:21;
y=1:21;
[x1,y1]=meshgrid(x,y);
figure(2)
mesh(x1,y1,z)
axis([1,21,1,21,0,2000])
xlabel('km')
ylabel('km')
zlabel('m')
for i=1:21
    information(i,:,:)=ones(21,21);     %��ʼ��Ϣ��
end
HeightData=z;

save HeightData HeightData