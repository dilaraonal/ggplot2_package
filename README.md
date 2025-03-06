## Exercises of **ggplot2** Package

Diggle et al. (1994) published data on the milk protein content of 79 cows. The data is available for each week from 1st to 19th week after calving (giving birth). The cows were dividend into three different groups in terms of feeding diet: Some were fed with only barley, some with only lupin, and some with the mix of barley and lupin. Use dplyr and ggplot2 packages to answer the following questions. Remove the rownames column from the data before proceeding with the questions.


**Diggle, Peter J., Liang, Kung-Yee and Zeger, Scott L. (1994), Analysis of longitudinal data, Oxford University Press, Oxford**

**(a)** Generate boxplots to show protein measurements for each feeding strategy (i.e. three different boxplots will appear in your graph). Does this visualized all the datapoints in the dataset? If not, generate a second boxplot graph where all the datapoints are visible in the graph. Comment on the graph. Which feeding strategy leads to highest protein content? 

**(b)** Filter the data to keep only the data for the 1st week of calving. Repeat the plot in (a). Which feeding strategy has the highest protein content based only on the 1st week data? Is the trend different from the overall result visualized in (a) ?

**(c)** Consider the data for the first 18 weeks. Select the following cows: B01, B02, BL01, BL02, L01, L02. Generate line plots to show how the protein content changes over time for each of these cows. The line for each cow should be in different colors. Each datapoint should also appear in the graph. 

**(d)** Generate the same graph in (c), but, this time, a separate plot should be plotted within the same graph for the cows with different feeding strategies (eg. three different subplots will be plotted). Analyze the results, do you see any interesting trend? 

**(e)** For each time point (each week), count the number of cows with data. Calculate also the average protein content for each time point. Generate a scatter plot of week number versus mean protein content. 

**(g)** Count the number of cows for each time point for each feeding strategy (eg. number of cows for week1 and barley diet, number of cows for week10 and lupin diet etc. should appear in your dataframe). Generate a scatter plot of week number versus mean protein content from this dataframe. Data points for each feeding strategy should appear in a different color in this plot. What would be your strategy to feed you cow based on this plot, why? 

**(h)** This data is in tidy format. Why? Generate a dataframe where there are separate columns for each week reporting the protein content, and each row shows a different cow.

## R Markdown (Rmd)
R Markdown (.Rmd) is a file format that combines R code, text, and visualizations into a single, dynamic document. It allows users to write reports, perform data analysis, and generate documents in various formats like HTML, PDF, and Word.
