ECG = load('ECG4.txt');
max_value = max(ECG);
ECG = ECG/max_value;
fs = 200; %sampling rate

t = [1:length(ECG)]/fs;

%% Original ECG %%
figure;
plot(t, ECG)
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Original ECG');
axis tight;

%% Lowpass Filter %%
[b_lp] = [1 0 0 0 0 0 -2 0 0 0 0 0 1];
[a_lp] = 32*[1 -2 1];

% figure;
freqz(b_lp, a_lp, fs);

sys = tf(b_lp,a_lp);
% figure;
% pzplot(sys);

%% Highpass Filter %%
[b_hp] = [-1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 -32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
[a_hp] = 32*[1 -1];

% figure;
freqz(b_hp, a_hp, fs);

sys = tf(b_hp,a_hp);
% figure;
% pzplot(sys);

%% Bandpass Filter %%
b_bp = conv(b_lp,b_hp);
a_bp = conv(a_lp,a_hp);

% figure;
freqz(b_bp, a_bp, fs);

sys = tf(b_bp,a_bp);
% figure;
% pzplot(sys);

ECG_bp = filter(b_bp,a_bp,ECG);
t = [1:length(ECG_bp)]/fs;

figure;
plot(t, ECG_bp)
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Bandpass Filtered ECG');
axis tight;

ECG_bp = ECG_bp(75:end);

%% Differentiator %%
b_der = [2 1 0 -1 -2];
a_der = 8*[1];

% figure;
freqz(b_der, a_der, fs);

sys = tf(b_der,a_der);
% figure;
% pzplot(sys);

ECG_der = filter(b_der,a_der,ECG_bp);
t = [1:length(ECG_der)]/fs;

figure;
plot(t, ECG_der)
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Derivative Filtered ECG');
axis tight;

%% Squaring Operator %%
ECG_sq = ECG_der.^2;

figure;
plot(t, ECG_sq)
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Squared ECG');
axis tight;

%% Moving Window Integration Operator %%
window = 30;

Coeff_ECG_avg = ones(1, window)/window;

% figure;
freqz(Coeff_ECG_avg, 1);

sys = tf(Coeff_ECG_avg,1);
% figure;
% pzplot(sys);

ECG_avg = filter(Coeff_ECG_avg, 1, ECG_sq);

t = [1:length(ECG_avg)]/fs;

figure;
plot(t, ECG_avg)
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Integrated ECG');
axis tight;

%% Detecting Total Beats in Signal and HR %%
thresh = max(ECG_avg)/2;
% thresh = 0.0002;    %change for ECG5

[pks, locs] = findpeaks(ECG_avg, t, 'MinPeakHeight', thresh, 'MinPeakDistance', 0.1); %change to 0.2 for ECG5
figure;
findpeaks(ECG_avg, t, 'MinPeakHeight', thresh, 'MinPeakDistance', 0.1) %change to 0.2 for ECG5
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Integrated ECG With R-Peaks Detected');
axis tight;

avg_RR = 0;
for i = 1: length(locs)-1
    avg_RR = (locs(i+1) - locs(i)) + avg_RR;
end
avg_RR = avg_RR/length(locs);

HR = 60/avg_RR;

%% Avg RR Interval and Standard Deviation of RR Intervals %%
for i = 1: length(locs)-1
    RR_intervals(i) = (locs(i+1) - locs(i));
end

RR_deviation = std(RR_intervals);
RR_deviation = RR_deviation*1000;

%% Average QRS Widths %%
% TF = islocalmin(ECG_avg, 'MinSeparation', 0.25, 'SamplePoints', t);
% figure;
% plot(t,ECG_avg,t(TF),ECG_avg(TF),'r*')
% 
% QS_intervals = [0.405 0.765 1.23 1.58 2.02 2.41 2.855 3.235 3.68 4.035]

[pks, locs] = findpeaks(ECG_avg, t, 'MinPeakHeight', -1, 'MinPeakDistance', 0.25); %change to 0.7 for ECG6
figure;
findpeaks(-ECG_avg, t, 'MinPeakHeight', -1, 'MinPeakDistance', 0.25) %change to 0.7 for ECG6
xlabel('Time in seconds');
ylabel('ECG');
title('Plot of Integrated ECG With Q- and S-peaks Detected');
axis tight;

locs = locs(2:end);

avg_QRSwidth = 0;
for i = 1: length(locs)-1
    avg_QRSwidth = (locs(i+1) - locs(i)) + avg_QRSwidth;
end
avg_QRSwidth = avg_QRSwidth/length(locs);
avg_QRSwidth = avg_QRSwidth*1000;
