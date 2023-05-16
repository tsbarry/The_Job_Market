import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import scipy.stats as stats
from sklearn.linear_model import LinearRegression


# Import csv data 
Biz_df_clean = pd.read_csv("")




#Biz_df_clean = Biz_df.drop(labels=["Unnamed: 0", "index", "Salary Estimate", "Job Description", "Location", "Headquarters", "Competitors", "HeadquarterCity"], axis=1)
Biz_df_clean.columns = ["Job Title", "Rating", "Company Name", "Size", "Founded", "Type of ownership", "Industry", 'Sector', "Revenue", "Easy Apply", "Avg_Salary", "Min_Salary", "Max_Salary", "City", "State", "Headquarter"]
Biz_df_clean.head()