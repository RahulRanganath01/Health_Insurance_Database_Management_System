import pandas as pd
import streamlit as st
import datetime
from database import view_all_data, view_only_policy_holder_names, get_policy_holder, edit_policy_holder_data


def update():
    result = view_all_data()
    df = pd.DataFrame(result, columns=['Policy_no', 'Name', 'Mobile_no', 'Email_id', 'City', 'Colony', 'House_no', 'Pincode', 'Nominee_name', 'Nominee_relation', 'Gender', 'Occupation', 'DOB', 'Edu_ql', 'AGE'])
    with st.expander("Current Policy Holders:"):
        st.dataframe(df)
    list_of_holders = [i[0] for i in view_only_policy_holder_names()]
    selected_policy_holders = st.selectbox("Policy Holders to Edit", list_of_holders)
    selected_result = get_policy_holder(selected_policy_holders)
    if selected_result:
        policy_no = selected_result[0][0]
        name = selected_result[0][1]
        mobile_no = selected_result[0][2]
        email = selected_result[0][3]
        city = selected_result[0][4]
        colony = selected_result[0][5]
        house_no = selected_result[0][6]
        pincode = selected_result[0][7]
        nom_name = selected_result[0][8]
        nom_relation = selected_result[0][9]
        gender = selected_result[0][10]
        occupation = selected_result[0][11]
        dob = selected_result[0][12]
        edu_ql = selected_result[0][13]
        age = selected_result[0][14]
        col1, col2, col3 = st.columns(3)
        with col1:
            new_policy_no = st.text_input("New Policy No:", policy_no)
            new_name = st.text_input("New Name:", name)
            new_mobile_no = st.text_input("New Mobile No:", mobile_no)
            new_email = st.text_input("New Email:", email)
            new_house_no = st.text_input("New House no:", house_no)

        with col2:
            new_city = st.text_input("New City:", city)
            new_colony = st.text_input("New Colony:", colony)
            new_pincode = st.text_input("New City:", pincode)
            new_occupation = st.selectbox(occupation, ["Doctor", "Teacher", "Student", "Engineer","Retired","Professor","Other"])
            new_edu_ql = st.selectbox(edu_ql, ["BE", "BSc", "MSc", "Diploma", "MBBS", "PhD", "Homemaker", "BCom", "MBA", "12th Pass", "Other"])

        with col3:
            new_age = st.text_input("New Age:", age)
            new_nominee_name = st.text_input("New Nominal Name:", nom_name)
            new_nominee_relation = st.selectbox(nom_relation, ["Spouse", "Child", "Friend", "Relative", "Parent", "Grandchild"])
            new_gender = st.selectbox(gender, ["Male", "Female", "Other"])
            new_DOB = st.date_input("DOB:", datetime.date(2022, 1, 1),datetime.date(1960, 1, 1))
        if st.button("Update Policy Holder Details"):
            edit_policy_holder_data(new_policy_no, new_name, new_mobile_no, new_email, new_city, new_colony, new_house_no, new_pincode, new_nominee_name, new_nominee_relation, new_gender, new_occupation, new_DOB, new_edu_ql, new_age,
            policy_no, name, mobile_no, email, city, colony, house_no, pincode, nom_name, nom_relation, gender, occupation, dob, edu_ql, age)
        st.success("Successfully updated:: {} to ::{}".format(name, new_name))
        result2 = view_all_data()
        df2 = pd.DataFrame(result2, columns=['Policy_no', 'Name', 'Mobile_no', 'Email_id', 'City', 'Colony', 'House_no', 'Pincode', 'Nominee_name', 'Nominee_relation', 'Gender', 'Occupation', 'DOB', 'Edu_ql', 'AGE'])
        with st.expander("Updated data"):
            st.dataframe(df2)
