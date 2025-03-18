f_1=2;f_2=40;T=1/12;
R_1=2*T;R_2=1.6*T;
f_s1=600;f_s2=600;
t1=-R_1:1/f_s1:R_1;
f_t1=exp(1i*2*pi*f_1*t1)+exp(1i*2*pi*f_2*t1);

t2=-R_2:1/f_s2:R_2;
f_t2=exp(1i*2*pi*f_1*t2)+exp(1i*2*pi*f_2*t2);
%4
 w=0:pi/100:4*pi;
 DTFT_w1=zeros(1,401);
 for i=1:401
    for k=1:201
        DTFT_w1(i)=DTFT_w1(i)+f_t1(k)*exp(-1i*w(i)*(k-101));
    end
 end
 subplot(3,2,1);
 plot(w/(2*pi),abs(DTFT_w1));
 title('DTFT R1');

 DTFT_w2=zeros(1,401);
 for i=1:401
    for k=1:161
        DTFT_w2(i)=DTFT_w2(i)+f_t2(k)*exp(-1i*w(i)*(k-81));
    end
 end
 subplot(3,2,2);
 plot(w/(2*pi),abs(DTFT_w2));
 title('DTFT R2');
%5
 n=0:200;
 k=0:200;
 DFT_w1=f_t1*(exp(-1i*2*pi/201)).^(n'*k);
 subplot(3,2,3);
 stem(k,abs(DFT_w1));
 title('201点DFT');

 n=0:160;
 k=0:160;
 DFT_w2=f_t2*(exp(-1i*2*pi/161)).^(n'*k);
 subplot(3,2,4);
 stem(k,abs(DFT_w2));
 title('161点DFT');
%6
 n=0:602;
 k=0:602;
 zero1=zeros(1,402);
 f_t3=[f_t1,zero1];
 DFT_w3=f_t3*(exp(-1i*2*pi/603)).^(n'*k);
 subplot(3,2,5);
 stem(k,abs(DFT_w3));
 title('603点DFT');

 n=0:482;
 k=0:482;
 zero2=zeros(1,322);
 f_t4=[f_t2,zero2];
 DFT_w4=f_t4*(exp(-1i*2*pi/483)).^(n'*k);
 subplot(3,2,6);
 stem(k,abs(DFT_w4));
 title('483点DFT');
