import pandas as pd

df = pd.read_csv(r'\netflix_data_cleaning\netflix.csv')

df.to_csv('netflix_pipe.csv', sep='|', index=False)