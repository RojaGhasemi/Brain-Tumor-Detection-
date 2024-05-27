# Project Title : Brain Tumor Detection using Local Features Extraction and Fuzzy Approach from MRI Images

## Abstract
In this research, an automated method for finding the exact range of the abnormal brain region in an MRI image has been investigated. This algorithm is based on fuzzy fragmentation that is used to detect a tumor in a brain medical device. The fuzzy fragmentation algorithm has the ability to quickly diagnose areas with heterogeneous and asymmetric tissue in a medical image. In order to extract the feature from the Gabor filter, it is a powerful method for extracting image texture. The PCA algorithm has been used to select useful features. In the end, SVM has been used to categorize the extracted features and tumor detection.

## Proposed Method
1. Pre-processing and segmentation
•	Resizing to 300×300
•	Segmentation using fuzzy k means (FCM)
2. Feature extraction using Gabor filter
3. Feature selection using PCA ( principal component analysis)
4. Feature classification and detection using SVM ( support vector machine)

## Dataset
Clinical dataset  ( 1000 MRI normal images, 1000 MRI abnormal images, 70% for training, 30% for testing)


## Results
 The results of our experiments on the BRAINX and clinical databases show that the proposed method has good efficiency and accuracy.

## How to Use
1.	Press train dataset button
2.	Then click open image for test
3.	Click tumor segmentation button
4.	Click feature extraction button
5.	Finally click recognition button

## Project History
This project was originally completed in 2011. The commit history has been adjusted to reflect the original dates of the work.
