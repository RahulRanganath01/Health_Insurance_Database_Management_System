import pandas as pd
import streamlit as st
from database import view_all_data, view_only_policy_holder_names, delete_data


def delete():
    result = view_all_data()
    df = pd.DataFrame(result, columns=['Policy_no', 'Name', 'Mobile_no', 'Email_id', 'City', 'Colony', 'House_no', 'Pincode', 'Nominee_name', 'Nominee_relation', 'Gender', 'Occupation', 'DOB', 'Edu_ql', 'AGE'])
    with st.expander("Current data"):
        st.dataframe(df)
    list_of_policy_holders = [i[0] for i in view_only_policy_holder_names()]
    selected_policy_holder = st.selectbox("Policy holder to Delete", list_of_policy_holders)
    st.warning("Do you want to delete ::{}?".format(selected_policy_holder))
    if st.button("Delete policy holder"):
        delete_data(selected_policy_holder)
        st.success("Policy holder has been deleted successfully")
    new_result = view_all_data()
    df2 = pd.DataFrame(new_result, columns=['Policy_no', 'Name', 'Mobile_no', 'Email_id', 'City', 'Colony', 'House_no', 'Pincode', 'Nominee_name', 'Nominee_relation', 'Gender', 'Occupation', 'DOB', 'Edu_ql', 'AGE'])
    with st.expander("Updated data"):
        st.dataframe(df2)
