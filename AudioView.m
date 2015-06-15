%--------------------------------------------------------------------------
%Visualiza forma de onda y espectro del espectro del archivo de entrada
%Salida: audio_out.wav
%--------------------------------------------------------------------------
%inFileName='./Audio/Procesado/audioOut.wav';
[FileName,PathName] = uigetfile('*.*','Seleccionar archivo de audio de entrada');
inFileName=strcat(PathName,FileName);
%--------------------------------------------------------------------------
[INy,INFs] = audioread(inFileName);
info = audioinfo(inFileName);
L=length(INy);

Y = fft(INy)/(L/2);
f = linspace(0,INFs, L);

t =  linspace(0,L/INFs, L);

figure();
subplot(2,1,1) 
plot(t,INy) 
title(strcat({'Forma de onda: '}, inFileName))
xlabel('Tiempo (Seg)')
ylabel('Amplitud')


subplot(2,1,2) 
plot(f(1:L/2+1),abs(Y(1:L/2+1))) 
title(strcat({'Espectro de: '}, inFileName))
xlabel('Frecuencia (Hz)')
ylabel('Amplitud')




%--------------------------------------------------------------------------
