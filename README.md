# ECG Analysis
The Pan-Tompkins Algorithm is a method of analyzing ECG signals in real-time based on the slope, amplitude, and width of QRS complexes. It uses a variety of filters, including a band-pass filter, a differentiator, a squaring operation, and finally, a moving window integrator.

A band-pass filter was used and made to be matched to the frequency spectrum of the QRS complex while attenuating noise due to EMG, 60 Hz power-line interference, baseline wander, and T-wave interference. Then, the 5-point derivative filter is used to extract information regarding the slope of the QRS complex while attenuating low frequencies and buffing the high-frequency components arising from the high slopes of QRS complexes. The squaring operator is used to make the signal hold only positive values and also amplifies the derivative operation. It emphasizes the higher frequencies from the QRS complexes, meaning they are significantly boosted while the P- and T-waves are further suppressed. Finally, the moving window integrator smoothes out the output from the previous steps to allow the QRS complex to be more easily isolated for analysis.

After going through all steps of filtering, the signal-to-noise ratio (SNR) is improved and the ECG signal is improved and more useable, so the signal can be analyzed using thresholds to detect QRS complexes which are now well above noise level peaks.

### Filter Design
#### Low-pass Filter
<img src="https://github.com/user-attachments/assets/7f47807c-8b64-4f66-9e8c-14e9cd4a4d41" width="400" height="300">
<img src="https://github.com/user-attachments/assets/a54b777d-f968-45ef-8f22-50f0b6b43d3d" width="400" height="300">

#### High-pass Filter
<img src="https://github.com/user-attachments/assets/7391181a-e31c-41c2-b59a-e986d2593679" width="400" height="300">
<img src="https://github.com/user-attachments/assets/04601e3d-d3b0-4a32-af14-2044371a6235" width="400" height="300">

#### Band-pass Filter
<img src="https://github.com/user-attachments/assets/ff99d537-4f5b-406f-a7ef-1662966edf26" width="400" height="300">
<img src="https://github.com/user-attachments/assets/3037339c-c1cb-44dc-9cb4-d8b5fa42ec0c" width="400" height="300">

#### Differentiator
<img src="https://github.com/user-attachments/assets/6aafe7a7-46eb-4546-a2c8-00fc31a5c5b2" width="400" height="300">
<img src="https://github.com/user-attachments/assets/0dd3abe2-9b01-46cc-ae5e-9b5a23389a86" width="400" height="300">

#### Moving Window Integrator
<img src="https://github.com/user-attachments/assets/0936da3c-6cfe-48f7-8125-47e2d419c784" width="400" height="300">
<img src="https://github.com/user-attachments/assets/284ec13a-7900-4eae-aa69-9728fad3367f" width="400" height="300">
