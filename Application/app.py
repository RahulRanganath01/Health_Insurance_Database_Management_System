# import mysql.connector
# mydb = mysql.connector.connect(host="localhost", user="root", password="")
# c = mydb.cursor()
# c.execute("CREATE DATABASE Health_Insurance_Management_System")


import streamlit as st
from create import create
from database import create_table
from delete import delete
from read import read
from update import update
from sql_stat import stat


def main():
    st.title("Health_Insurance_Management_System")
    menu = ["Add", "View", "Edit", "Remove", "SQL_Statement"]
    choice = st.sidebar.selectbox("Menu", menu)
    if choice == "Add":
        st.subheader("Enter Policy Holder Details Details:")
        create()
    elif choice == "View":
        st.subheader("View the Created records")
        read()
    elif choice == "Edit":
        st.subheader("Update the Created records")
        update()
    elif choice == "Remove":
        st.subheader("Delete the Created records")
        delete()
    elif choice == "SQL_Statement":
        st.subheader("Enter the SQL Command")
        stat()
    else:
        st.subheader("About records")


if __name__ == main():
    main()
