import pandas as pd
import streamlit as st
from database import view_all_data, plan_type_view
import plotly.express as px
def read():
    result = view_all_data()
    result2 = plan_type_view()

    df = pd.DataFrame(result, columns=['Policy_no', 'Name', 'Mobile_no', 'Email_id', 'City', 'Colony', 'House_no', 'Pincode', 'Nominee_name', 'Nominee_relation', 'Gender', 'Occupation', 'DOB', 'Edu_ql', 'AGE'])
    df1 = pd.DataFrame(result2, columns = ['Policy_no', 'Name','Plan_No'])
    with st.expander("View all Policy Holders"):
        st.dataframe(df)

    with st.expander("Distribution of Insurance Policy Plans"):
        task_df = df1['Name'].value_counts().to_frame()
        task_df = task_df.reset_index()
        st.dataframe(task_df)
        p1 = px.pie(task_df, names = 'index', values = 'Name')
        st.plotly_chart(p1)
