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

### Plots of Raw and Filtered/Processed ECG
#### Example ECG 1
<img src="https://github.com/user-attachments/assets/e30729f8-412f-4a5a-8673-7a669ac72eb6" width="400" height="300">
<img src="https://github.com/user-attachments/assets/b1884a59-7d85-4985-b2eb-e1b02e1e2c75" width="400" height="300">
<img src="https://github.com/user-attachments/assets/862235fe-cf69-4283-aef1-320b2df950aa" width="400" height="300">
<img src="https://github.com/user-attachments/assets/13410ed7-b654-4977-ad41-ee12f12b7679" width="400" height="300">
<img src="https://github.com/user-attachments/assets/5d12fe4c-cd85-4c90-bb21-5b2aba28a01f" width="400" height="300">
<img src="https://github.com/user-attachments/assets/a4b54489-143c-4dfe-9771-8da1683990d9" width="400" height="300">
<img src="https://github.com/user-attachments/assets/64e52a78-6378-4bdd-8635-90403f4abd08" width="400" height="300">

#### Example ECG 2
<img src="https://github.com/user-attachments/assets/3ef4444b-55ad-42f1-bd8c-d86e2c4fc56b" width="400" height="300">
<img src="https://github.com/user-attachments/assets/f1312fe1-2a75-46e0-ac79-a1cca5fae991" width="400" height="300">
<img src="https://github.com/user-attachments/assets/3d7716bd-903a-4f0d-83bf-c8a7946f5048" width="400" height="300">
<img src="https://github.com/user-attachments/assets/76bbbf5c-289c-4f26-a56e-1b886f99cb53" width="400" height="300">
<img src="https://github.com/user-attachments/assets/db68ecd8-9568-45d5-9795-0c029feedab0" width="400" height="300">
<img src="https://github.com/user-attachments/assets/4cda9b69-592e-48db-91d5-dfe766ccbb6d" width="400" height="300">
<img src="https://github.com/user-attachments/assets/c2371cbb-7f22-4919-b256-acbaae8322f8" width="400" height="300">

### Results and Parameters
<img src="https://github.com/user-attachments/assets/c847dc9f-9311-4f5d-8ffb-741288107408" width="400" height="115">
