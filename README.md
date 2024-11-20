# ECG and EEG Signal Processing Experiments

## Experiment 1: Record Single Lead ECG at a Desired Sampling Frequency (Apparatus: BioPac)

### Theory:
The ECG (electrocardiogram) is a quick, painless, and non-invasive test that measures the electrical activity of the heart. During the test, electrodes are placed on the arms and foot. The electrocardiograph (ECG) provides a graphical record of the electrical activity in a patient's heart, demonstrating cardiac activity. The standard clinical ECG is done through the augmented leads known as:
- (i) aV: Left arm
- (ii) aV: Left foot
- (iii) aV: Right foot

The ECG is drawn using the Einthoven's triangle, which consists of three leads: Lead I, Lead II, and Lead III, attached to the arms and legs of the body. The ECG consists of four types of waves:
1. P-wave
2. QRS complex
3. ST segment
4. T-wave

### Result:
A single lead ECG has been studied and recorded successfully.

---

## Experiment 2: ECG Difference Between Lead 1 and Lead 3 (Apparatus: BioPac)

### Theory:
The ECG is a quick, painless, and non-invasive test that measures the electrical activity of the heart. Electrodes are placed on the arms, chest, and legs, connected to an ECG machine by lead wires. The equipment provided the 3-lead system for measuring ECG. The leads used are:
- **Lead I**: Measures the tension between the right and left arm. The electrode connections are as follows:
  - Left arm: +ive
  - Right arm: -ive
  - Right leg: GND
- **Lead II**: Measures the tension between the right arm and left leg. The connections are as follows:
  - Right arm: -ive
  - Right leg: GND
  - Left leg: +ive

### Result:
Lead I and Lead II have been analyzed and studied successfully.

---

## Experiment 3: Baseline Wander (Apparatus: MATLAB)

### Theory:
Baseline wander, or baseline drift, refers to variations in the baseline of an ECG signal, caused by factors such as patient or electrode movement and electrical interference. This effect makes the trace axis of the graph appear to wander up and down. Adaptive filtering is used to minimize these baseline variations and achieve a cleaner signal by removing noise and artifacts.

---

## Experiment 4: Determine Heart Rate from Recorded ECG Signal (Apparatus: BioPac)

### Theory:
Heart rate is measured as the number of beats per minute (BPM). It reflects the number of times the heart contracts, pushing blood through the body, which is controlled by the electrical activity of the heart. ECG data is used to measure the R-R interval and calculate BPM using specific formulas, providing a reliable metric of cardiovascular health.

---

## Experiment 5: Single and Multilead EEG Signal (Apparatus: MATLAB)

### Theory:
A brain is encased by a cranium (skull), and electrical activity across neurons in the brain generates patterns detectable by advanced monitoring techniques. These signals often exhibit predictable waveforms, including alpha, beta, delta, and theta rhythms. These rhythms vary in frequency and are frequently analyzed during activities like sleep. Patterns in these rhythms give insights into neural activity and brain states.

---

## Experiment 6: Fast Fourier Transform (FFT) (Apparatus: MATLAB)

### Theory:
The Fast Fourier Transform (FFT) is a mathematical algorithm used to convert a time-domain signal, such as an ECG waveform, into its frequency-domain representation. The FFT allows for analysis of the signal's constituent sinusoidal components at different frequencies, helping in understanding the frequency spectrum and detecting abnormalities in ECG signals.

---

## Experiment 7: Study the Effect of Filters (Apparatus: MATLAB)

### Theory:
Filters are used in signal processing to modify or enhance specific features of signals. The types of filters used are:
- **Low-pass filters**: Allow signals with frequencies lower than a specified cutoff frequency to pass through while attenuating signals with higher frequencies.
- **High-pass filters**: Allow signals with frequencies higher than the cutoff frequency to pass through while attenuating lower frequencies.
- **Notch filters**: Attenuate signals within a narrow frequency range while allowing others to pass through.

These filters are essential in ECG signal processing to remove noise or isolate specific frequency components for analysis.

---
