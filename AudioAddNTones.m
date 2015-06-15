%--------------------------------------------------------------------------
%Agrega N tonos de xxxHz a archivo de entrada
%Entrada: audio_in.wav
%Salida: audio_out.wav
%--------------------------------------------------------------------------
%inFileName='./Audio/Muestras/audio_1.wav';
[FileName,PathName] = uigetfile('*.*','Seleccionar archivo de audio de entrada');
inFileName=strcat(PathName,FileName);
%outFileName='./Audio/Procesado/audio_out!.wav';
[FileName,PathName] = uigetfile('*.*','Seleccionar archivo de audio de salida');
outFileName=strcat(PathName,FileName);
toneFreqs = [50,500,1000]; %Vector de n tonos agreagados al archivo de entrada
OUTNbits=16; %16 bits
OUTFs = 16000;      
%--------------------------------------------------------------------------
[INy,INFs] = audioread(inFileName);
info = audioinfo(inFileName);
if info.NumChannels==2
   INyMono=INy(:,1)+INy(:,2);
   INyMono=INyMono/max(abs(INyMono));
else
   INyMono=INy;
end
[p,q] = rat(OUTFs/INFs,0.0001);
yAudioRead = resample(INyMono,p,q);
nFreqs=length(toneFreqs);
yAudioOut=yAudioRead;
for i=1:length(toneFreqs)  
yAudioOut = yAudioOut + sin(linspace(0, info.Duration*toneFreqs(i)*2*pi, length(yAudioRead))');
end
yAudioOut=yAudioOut/(nFreqs+1);
FreqString=int2str(toneFreqs);
FreqString=strrep(FreqString, '  ', '-');
outFileName=strrep(outFileName, '!', FreqString);
audiowrite(outFileName,yAudioOut,OUTFs, 'BitsPerSample',OUTNbits);
%--------------------------------------------------------------------------



