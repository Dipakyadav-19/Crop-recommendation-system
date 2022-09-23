# Crop-recommendation-system
A.	Experimental data with parameters
Crop yield prediction relies on many attributes but not all of them predict the right value. The harvest yield is determined by factors that affect it most. In order to predict the yield of the crop with greater accuracy, attribute selection plays a key role. The yield output can be processed by only a few specific attributes.
The section discusses the input parameters for predicting various crops like wheat, maize, and cotton yields. In order to perform the analysis, it is necessary to collect data from multiple sources. It must be in a certain form which has to be altered again based on the attributes. 
11 crops are identified and then standard crop pH values are used these crops are Sugarcane, Cotton, Coffee, Rice, Jowar, Bajra, Moong, Maize, Wheat, Groundnut and Sunflower.        The datasets used are as follows:
1.	Crop Data: This dataset has following headers: District name, Crop year, Season, Crop, Area and Production. 
2.	Crop Required Rainfall: This dataset gives the minimum and maximum rainfall for the crops.
3.	Maharashtra State Rainfall: This dataset gives us information of Rainfall for all the 12 months for all districts in Maharashtra from 2004-2020.
The system uses the area, the rainfall and the standard value of soil where the crop will be grown.




B.	Flowchart 
 <img src="https://github.com/Dipakyadav-19/Crop-recommendation-system/blob/master/Image/Flowchart.jpg" alt="Alt text" title="Optional title">

C.	Code flow
First the PH data for required district was retrieved from District pH data. System then compares the PH data for selected district with the PH data for all the crops. Crops requiring pH less than minimum pH of city and maximum PH greater than maximum PH for the city was shortlisted and stored in result 1.  
Then the rainfall was taken into consideration.  Mean rainfall for selected district was calculated and crops with minimum required rainfall less than mean rainfall for given district and maximum rainfall greater than mean rainfall were shortlisted and stored in result 2. The density plot for rainfall of selected city is displayed. 
For the production dataset first, the average yield which is production/area for all the crops was calculated. And then the crops whose yield is greater than average yield were selected and stored in result 3. Then the intersection of result 1, result 2 and result 3 was recommended as crop for that particular city.  Average yield was returned as the average of that crop from 1997 to 2014 from the crop data dataset.  The graph of year vs production and area vs production for recommended crop is displayed further. The software used is RStudio version 1.4.1103.






IV.	RESULTS AND DISCUSSIONS
The console output for district Ahmednagar is given below:
 
As given in the output screenshot predicted crop is Cotton and expected yield is 11.59 per unit of area.  The graphs displayed as follows:
1.	This graph gives density plot of annual rainfall of selected city(Ahmednagar).
 <img src="https://github.com/Dipakyadav-19/Crop-recommendation-system/blob/master/Image/rainfall.png" alt="Alt text" title="Optional title">

2.	This graph shows the Area vs Production for recommended crop.
 
<img src="https://github.com/Dipakyadav-19/Crop-recommendation-system/blob/master/Image/production.png" alt="Alt text" title="Optional title">

3.	This graph shows the Year vs Production for recommended crop.
 <img src="https://github.com/Dipakyadav-19/Crop-recommendation-system/blob/master/Image/cotton.png" alt="Alt text" title="Optional title">

 
The following main results were obtained:
1.The analysis of rainfall and temperature area wise helps us determine the most suitable range required for different crops.
2.Analysing pH values of land with the above analysis of rainfall and temperature, a regression model is created to help predict which crop is most suitable in which area.
3.Area vs Production helps to reinforce the correctness of this model.
 
V.	FUTURE SCOPE
In future, this project work may be extended by applying different prediction techniques like fuzzy logic, decision trees, Support Vector Regression (SVR) and other machine learning approaches. This work outperforms many models but research can be done to recommend crop with accuracy that is better than what this work proposes. The correlation between prediction variables may also be found, giving importance to variables for prediction and recommendation.



VI.	CONCLUSION
The proposed machine recommends crops to the farmers and predicts the yield of the crops. The main factors are Rainfall, PH and production over years at that place. The factors taken into consideration are diversified in such way that the results can be relied on to a large extent. Further the graphs of production displayed also give idea of how the crop has performed over years and how much area can we allocate to a particular crop to get best yield out of it.

  
