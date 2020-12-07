def create_visualization():
    import pandas as pd
    df1=pd.read_csv("/Stressors_weekdays_timeofday_1.csv")

    import plotly.express as px
    fig1=px.sunburst(df1, path=[ 'Stressors', 'Location','Time of day'], values='Frequency')
    fig1.update_layout(height = 800 , margin = {'t':0, 'b':0, 'l':0})
    return fig1
    
    