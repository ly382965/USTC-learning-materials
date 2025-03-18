 x_n=[1,1,0,1];
 %DTFT
 w=-10:0.02:10;
 DTFT_Xw=zeros(1,1001);
 for i=1:1001
    for k=1:4
        DTFT_Xw(i)=DTFT_Xw(i)+x_n(k)*exp(-1i*w(i)*k);
    end
 end
 subplot(1,3,1);
 plot(w/(2*pi),abs(DTFT_Xw));
 title('DTFT');
 xlabel('频率');
 ylabel('幅度');

 n=0:3;
 k=0:3;
 DFT_Xw=x_n*(exp(-1i*pi/2)).^(n'*k);
 subplot(1,3,2);
 stem(k,abs(DFT_Xw));
 title('4点DFT');

 DTFT_rebuild=zeros(1,1001);
 w=-10:0.02:10;
 for i=1:1001
    for k=0:3
        DTFT_rebuild=DTFT_rebuild+1/4*DFT_Xw(k+1)*(1-exp(-1i*w(i)*4))/(1-exp(1i*2*pi*k/4)*exp(-i*w(i)));
    end
 end
 subplot(1,3,3);
 plot(w/(2*pi),abs(DTFT_Xw));
 title('DFT重建');
 xlabel('频率');
 ylabel('幅度');