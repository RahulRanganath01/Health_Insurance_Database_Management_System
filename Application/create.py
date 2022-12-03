import streamlit as st
import datetime
from database import add_data
def create():
    col1, col2, col3 = st.columns(3)
    with col1:
        Policy_no = st.text_input("Policy No:")
        Policy_holder_name = st.text_input("Policy Holder Name:")
        Mobile_No = st.text_input("Mobile No:")
        email_id = st.text_input("Email ID:")
        DOB = st.date_input("DOB (yyyy-mm-dd):", datetime.date(2022, 1, 1),datetime.date(1960, 1, 1))


    with col2:
        gender = st.selectbox("Gender", ["Male", "Female", "Other"])
        occupation = st.selectbox("Occupation", ["Doctor", "Teacher", "Student", "Engineer","Retired","Professor","Other"])
        age = st.text_input("Age:")
        education = st.selectbox("Educational Qualification", ["BE", "BSc", "MSc", "Diploma", "MBBS", "PhD", "Homemaker", "BCom", "MBA", "12th Pass", "Other"])
        house_no = st.text_input("House_No:")

    with col3:
        city = st.text_input("City:")
        colony = st.text_input("Colony:")
        pincode = st.text_input("PinCode:")
        nominee_name = st.text_input("Nominee Name:")
        nominee_relation = st.selectbox("Nominee relation", ["Spouse", "Child", "Friend", "Relative", "Parent", "Grandchild"])


    if st.button("Add Policy Holder Record"):
        add_data(Policy_no, Policy_holder_name, Mobile_No, email_id, city, colony, house_no, pincode, nominee_name, nominee_relation, gender, occupation, DOB, education, age)
    st.success("Successfully added Policy Holder record: {}".format(Policy_holder_name))

