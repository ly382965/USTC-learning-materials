close all
clear all
syms t;
f_q=100;
f_x2 = sin(2*pi*f_q*t)*exp(-100*t)*heaviside(t);
syms w;
FT_x2 = fourier(f_x2,w); 
figure(1);
hold on;
fplot(abs(FT_x2),[-2000,2000]);
title('CFT');
xlabel('频率(hz)');
ylabel('幅度');

f_w= @(w) (abs(- 1i./(2*(w.*1i - pi*200i + 100)) + 1i./(2*(w.*1i + pi*200i + 100)))).^2;

E=integral(f_w,-2000,2000)/2*pi;
E_1=0.95*E;
for i=1:2000
    if(integral(f_w,-i,i)/2*pi>=0.95*E_1)
        break;
    end
end

figure(2);
t_1=0:1/f_q:1;
t_2=0:1/(4*f_q):1;
t_3=0:1/(6*f_q):1;
t_4=0:1/(10*f_q):1;
f_t1 = sin(2*pi*f_q*t_1).*exp(-100*t_1);
f_t2 = sin(2*pi*f_q*t_2).*exp(-100*t_2);
f_t3 = sin(2*pi*f_q*t_3).*exp(-100*t_3);
f_t4 = sin(2*pi*f_q*t_4).*exp(-100*t_4);

w=0:pi/100:2*pi;
DTFT_w1=zeros(1,201);
for i=1:201
    for k=1:101
        DTFT_w1(i)=DTFT_w1(i)+f_t1(k)*exp(-1i*w(i)*(k-1));
    end
end
max1=max(abs(DTFT_w1));
subplot(2,2,1);
plot(w/(2*pi),abs(DTFT_w1)/max1);
title('DTFT f_q');
xlabel('频率归一化');
ylabel('幅度归一化');


DTFT_w2=zeros(1,201);
for i=1:201
    for k=1:401
        DTFT_w2(i)=DTFT_w2(i)+f_t2(k)*exp(-1i*w(i)*(k-1));
    end
end
max2=max(abs(DTFT_w2));
subplot(2,2,2);
plot(w/(2*pi),abs(DTFT_w2)/max2);
title('DTFT 4f_q');
xlabel('频率归一化');
ylabel('幅度归一化');


DTFT_w3=zeros(1,201);
for i=1:201
    for k=1:601
        DTFT_w3(i)=DTFT_w3(i)+f_t3(k)*exp(-1i*w(i)*(k-1));
    end
end
max3=max(abs(DTFT_w3));
subplot(2,2,3);
plot(w/(2*pi),abs(DTFT_w3)/max3);
title('DTFT 6f_q');
xlabel('频率归一化');
ylabel('幅度归一化');


DTFT_w4=zeros(1,201);
for i=1:201
    for k=1:1001
        DTFT_w4(i)=DTFT_w4(i)+f_t4(k)*exp(-1i*w(i)*(k-1));
    end
end
max4=max(abs(DTFT_w4));
subplot(2,2,4);
plot(w/(2*pi),abs(DTFT_w4)/max4);
title('DTFT 10f_q');
xlabel('频率归一化');
ylabel('幅度归一化');
