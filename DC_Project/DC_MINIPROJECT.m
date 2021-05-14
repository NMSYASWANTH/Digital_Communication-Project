%{                                                       
                                                          TEAM-5
                                                    DC_LAB_MINIPROJECT
                                                  REMOVING THE AWGN NOISE                                                     
%}
%{                                    
   PROJECT DESCRIPTION: We aim to develop noise reduction

   step-1: Taking any audio or the music as the input signal 
   step-2: Adding the white gaussian noise
   step-3: Passing this signal through a Lowpass filter
   step-4: Ploting all the three signals and observing the difference
%}
%%
[y,Fs]=audioread("C:\Users\csys7\Desktop\DC_mini2.ogg"); %Taking an audio file from the localdisc
n=1/Fs;
figure,
plot(y);
xlabel('samples');
ylabel('amplitude');
title('original audio signal');
%sound(y,Fs) %sound(Y,FS) sends the signal in vector Y (with sample frequency FS) out to the speaker on platforms that support sound.
pause(12)   % pause(n) pauses for n seconds before continuing,

%%
%step-2
y1 = awgn(y,25);% here 40 is the Signal to noise ratio(SNR)
noisy = y1;
figure,
plot(y1);
xlabel('samples');
ylabel('amplitude');
title('awgn(noise added to original signal)');
%sound(noisy,Fs)
pause(12) 
%%
%step-3

%Fp = passband frequency
%Fst = stopband frequency
%Ap = passband ripple
%Ast = stopband attenuation

filteredsignal = fdesign.lowpass('Fp,Fst,Ap,Ast',1e-10,0.2,0.2,1e-5);%lowpass filter function
D = design(filteredsignal);
freqz(D);%freqz(B,A,N) returns the N-point complex frequency response vector H and the N-point frequency vector W in radians/sample of the filter:    
x = filter(D,noisy);
figure,plot(x);
title('denoise');
xlabel('samples');
ylabel('amplitude');
%sound(x,Fs)
pause(12)
%%
%step-4
figure,
subplot(2,2,1)
plot(y);
xlabel('samples');
ylabel('amplitude');
title('original audio signal');
subplot(2,2,2)
plot(y1);
xlabel('samples');
ylabel('amplitude');
title('awgn(noise added to original signal)'); 
subplot(2,2,3)
plot(x);
title('denoise');
xlabel('samples');
ylabel('amplitude');