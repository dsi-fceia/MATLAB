%--------------------------------------------------------------------------
%Genera N tonos de xxxHz
%Salida: audioOut.wav
%--------------------------------------------------------------------------
outFileName='./Audio/Procesado/audioOut!.wav';
toneFreqs = [50,1000]; %Vector de n tonos agreagados al archivo de entrada
Duration = 5;
OUTNbits=16; %16 bits
OUTFs = 16000;      
%--------------------------------------------------------------------------
nFreqs=length(toneFreqs);
yAudioOut=0;
for i=1:length(toneFreqs)  
yAudioOut = yAudioOut + sin(linspace(0, Duration*toneFreqs(i)*2*pi, Duration*OUTFs)');
end
yAudioOut=yAudioOut/nFreqs;
FreqString=int2str(toneFreqs);
FreqString=strrep(FreqString, '  ', '-');
outFileName=strrep(outFileName, '!', FreqString);
audiowrite(outFileName,yAudioOut,OUTFs, 'BitsPerSample',OUTNbits);
%--------------------------------------------------------------------------
