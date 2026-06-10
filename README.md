# What Makes a YouTube Video Trend?

A multi-method statistical analysis of **200,000+ YouTube trending-video records** across five countries, using regression, classification, and hypothesis testing to identify what drives a video onto — and keeps it on — YouTube's trending page.

## Overview

YouTube's trending page is algorithmically curated and its exact ranking factors are undisclosed. This project treats the trending list as a measurable outcome and asks two questions:

- **Q1 —** Which engagement metrics (views, likes, dislikes, comments) are most associated with trending performance, and does this vary by content category?
- **Q2 —** Can a video's first-day engagement predict how long it stays on the trending list?

## Dataset

Source: the [Trending YouTube Video Statistics](https://www.kaggle.com/datasets/datasnaek/youtube-new) dataset (Kaggle, user `datasnaek`), collected via the YouTube Data API from **November 2017 to June 2018** across the US, Great Britain, Canada, Germany, and France. Each row is one video on one day's trending list; the data totals 180,000+ rows, with a companion JSON mapping category IDs to labels.

> **Note:** the raw CSV/JSON files are not included in this repo. Download them from the Kaggle link above and place them in the project directory before knitting.

## Approach

- Combined five country files and aggregated to the video level to handle videos that appear on multiple days' lists.
- Applied `log(x+1)` transformations to all engagement metrics, which are heavily right-skewed (skewness ~10–40) due to viral outliers.
- **Multiple linear regression** to identify which engagement metrics most strongly predict trending views, with category and country controls.
- **Logistic regression** to classify whether a video trends for 3+ days using first-day engagement, evaluated on a held-out test set with a confusion matrix.
- **Negative binomial regression** to model trend duration as an overdispersed count outcome (Poisson assumptions were violated).
- **ANOVA and chi-square tests** to compare engagement levels and category distributions across countries.

## Key Findings

1. **Likes and views are the strongest engagement predictors.** In the multiple linear regression, `log(likes)` is the dominant positive predictor of trending views; dislikes and comments contribute positively but less, consistent with the idea that *any* engagement signals algorithmic visibility.

2. **First-day momentum predicts staying power.** The logistic regression classifies whether a video trends 3+ days from first-day engagement alone with **~72% test accuracy**, with first-day views and likes as the dominant predictors.

3. **Category and country both matter.** Music and Entertainment dominate across all countries, but the weight of engagement metrics shifts by category and the category mix differs significantly by country (chi-square, p < 0.001) — e.g., News & Politics and Autos feature more prominently in Germany and France.

## Tech Stack

R · tidyverse · MASS (negative binomial) · GGally · lubridate · knitr · ggplot2

## Repository Structure

```
youtube-trending-analysis/
├── youtube_trending_final.Rmd   # full analysis (R Markdown)
├── install_packages.R           # install required R packages
└── README.md
```

## How to Run

1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/datasnaek/youtube-new) and place the CSV files and `US_category_id.json` in the project directory.
2. Install dependencies: `Rscript install_packages.R`
3. Open `youtube_trending_final.Rmd` in RStudio and knit to PDF.

## Team

Group project for STA 141A (UC Davis). Contributors: Sri Krishanu Ramadhenu, Nikhil Karthikeyan, Dayaabaran Ragunathan, Karthik Ravi.
