% User selects a file
[filename,pathname]=uigetfile({'*.wav','WAVE files (.wav)';'*.*','All Files (*.*)'},'Open');
% Load the wave file:
[doppler,f_sample]=audioread(fullfile(pathname,filename));
%play the Doppler signal if you want to %soundsc(doppler,f_sample);
% Make a spectrogram
% Specify the size of the FFT (number of samples/FFT)
FFT_length=256
% Number of samples to shift from one FFT to the next
% Note these values result in 50% overlap between each FFT
stride=128;
% Determine the number of FFTs to calculate
% "floor" rounds towards -infinity, e.g. floor(4.8) = 4 
N_FFT=floor((length(doppler)-FFT_length)/stride);
% Pre-allocate memory for the spectrogram
% Try running without this line and see how much longer it takes! 
sg=zeros(FFT_length/2,N_FFT);
% Calculate the FFTs

for n=1:N_FFT, temp=abs(fft(doppler((1:FFT_length)+(n-1)*stride))); sg(:,n)=(temp(1:128));
end
% Display spectrogram:
% convert spectrogram to dB scale 
sg_dB=20*log10(sg/max(sg(:)));
% min and max time, frequency
time_scale=[0 length(doppler)-1]/f_sample; freq_scale=[0 127]/256*f_sample;
% Display the image
imagesc(time_scale,freq_scale,sg_dB,[-30 0]);
%Flip the y-axis back to normal so zero Hz is at the bottom
set(gca,'YDir','normal'); colormap(gray); %make it black-and-white xlabel('Time (s)');
ylabel('Doppler shift (Hz)')
 


 

 

