---
title: "Codebook Getting and Cleaning Data"
author: "Gonzalo C"
date: "31/7/2018"
output:
  html_document:
    keep_md: yes
---

You should include a README.md in the repo describing how the script works and the code book describing the variables.

## Project Description: Tidy samsung data - variables codebook
This is the codebook for the file tidy_data.txt, the first row is the name of each variable. From row number 2, values

### Variables
In order to fulfill the requirements of the project. As you can see in the file, this are variables: 

Identifiers -> from 1 to 30

Activities -> WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; and LAYING

Variables are separeted between timedomain and frequencydomain, as in original dataset. 

## Time domain: 
timeDomainBodyAccelerometerMean (for X, Y and Z) 
timeDomainBodyAccelerometerStandardDeviation (for X, Y and Z) 
timeDomainBodyAccelerometerMagnitudeMean 
timeDomainBodyAccelerometerMagnitudeStandardDeviation

timeDomainGravityAccelerometerMean (for X, Y and Z)
timeDomainGravityAccelerometerStandardDeviation (for X, Y and Z) 
timeDomainGravityAccelerometerMagnitudeMean
timeDomainGravityAccelerometerMagnitudeStandardDeviation

timeDomainBodyAccelerometerJerkMean (for X, Y and Z) 
timeDomainBodyAccelerometerJerkStandardDeviation (for X, Y and Z) 
timeDomainBodyAccelerometerJerkMagnitudeMean 
timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation

timeDomainBodyGyroscopeMean (for X, Y and Z) 
timeDomainBodyGyroscopeStandardDeviation (for X, Y and Z) 
timeDomainBodyGyroscopeMagnitudeMean 
timeDomainBodyGyroscopeMagnitudeStandardDeviation

timeDomainBodyGyroscopeJerkMean (for X, Y and Z) 
timeDomainBodyGyroscopeJerkStandardDeviation (for X, Y and Z) 
timeDomainBodyGyroscopeJerkMagnitudeMean 
timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

## Frequency domain 
frequencyDomainBodyAccelerometerMean (for X, Y and Z)
frequencyDomainBodyAccelerometerStandardDeviation (for X, Y and Z)
frequencyDomainBodyAccelerometerMeanFrequency (for X, Y and Z)
frequencyDomainBodyAccelerometerMagnitudeMean
frequencyDomainBodyAccelerometerMagnitudeMeanFrequency 
frequencyDomainBodyAccelerometerMagnitudeStandardDeviation 

frequencyDomainBodyAccelerometerJerkMean (for X, Y and Z)
frequencyDomainBodyAccelerometerJerkStandardDeviation (for X, Y and Z)
frequencyDomainBodyAccelerometerJerkMeanFrequency (for X, Y and Z)
frequencyDomainBodyAccelerometerJerkMagnitudeMean
frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency
frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation


frequencyDomainBodyGyroscopeMean (for X, Y and Z)
frequencyDomainBodyGyroscopeStandardDeviation (for X, Y and Z)
frequencyDomainBodyGyroscopeMeanFrequency (for X, Y and Z)
frequencyDomainBodyGyroscopeMagnitudeMean 
frequencyDomainBodyGyroscopeMagnitudeStandardDeviation 
frequencyDomainBodyGyroscopeMagnitudeMeanFrequency 
frequencyDomainBodyGyroscopeJerkMagnitudeMean 
frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation 
frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency
