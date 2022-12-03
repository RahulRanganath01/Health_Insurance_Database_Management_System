import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root", password="", database="Health_Insurance_Management_System")
c = mydb.cursor()


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS (Policy_no TEXT, Name TEXT, Mobile_no TEXT, Email_id TEXT, City TEXT, Colony TEXT, House_no TEXT, Pincode TEXT, Nominee_name TEXT, Nominee_relation TEXT, Gender TEXT, Occupation TEXT, DOB TEXT, Edu_ql TEXT, AGE TEXT)')


def add_data(Policy_no, Name, Mobile_no, Email_id, City, Colony, House_no, Pincode, Nominee_name, Nominee_relation, Gender, Occupation, DOB, Edu_ql, AGE):
    c.execute('INSERT INTO policy_holder(Policy_no, Name, Mobile_no, Email_id, City, Colony, House_no, Pincode, Nominee_name, Nominee_relation, Gender, Occupation, DOB, Edu_ql, AGE) '
              'VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
              (Policy_no, Name, Mobile_no, Email_id, City, Colony, House_no, Pincode, Nominee_name, Nominee_relation, Gender, Occupation, DOB, Edu_ql, AGE))
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM policy_holder')
    data = c.fetchall()
    return data

def plan_type_view():
    c.execute('SELECT * FROM policy_holders_and_plans')
    data = c.fetchall()
    return data


def view_only_policy_holder_names():
    c.execute('SELECT Name FROM policy_holder')
    data = c.fetchall()
    return data


def get_policy_holder(policy_holder_name):
    c.execute('SELECT * FROM policy_holder WHERE Name="{}"'.format(policy_holder_name))
    data = c.fetchall()
    return data


def edit_policy_holder_data(new_Policy_no, new_Policy_holder_name, new_Mobile_No, new_email_id, new_city, new_colony, new_house_no, new_pincode, new_nominee_name, new_nominee_relation, new_gender, new_occupation, new_DOB, new_education, new_age, policy_no, name, mobile_no, email, city, colony, house_no, pincode, nom_name, nom_relation, gender, occupation, dob, edu_ql, age):
    c.execute("UPDATE policy_holder SET Policy_no=%s, Name=%s, Mobile_no=%s, Email_id=%s, City=%s, Colony=%s, House_no=%s, Pincode=%s, Nominee_name=%s, Nominee_relation=%s, Gender=%s, Occupation=%s, DOB=%s, Edu_ql=%s, AGE=%s"
              "WHERE Policy_no=%s and Name=%s and Mobile_no=%s and Email_id=%s and City=%s and Colony=%s and House_no=%s and Pincode=%s and Nominee_name=%s and Nominee_relation=%s and Gender=%s and Occupation=%s and DOB=%s and Edu_ql=%s and AGE=%s ",
               (new_Policy_no, new_Policy_holder_name, new_Mobile_No, new_email_id, new_city, new_colony, new_house_no, new_pincode, new_nominee_name, new_nominee_relation, new_gender, new_occupation, new_DOB, new_education, new_age, policy_no, name, mobile_no, email, city, colony, house_no, pincode, nom_name, nom_relation, gender, occupation, dob, edu_ql, age))
    mydb.commit()
    data = c.fetchall()
    return data


def delete_data(policy_holder_name):
    c.execute('DELETE FROM policy_holder WHERE Name="{}"'.format(policy_holder_name))
    mydb.commit()

def get_sql(statement):
    c.execute(statement)
    data = c.fetchall()
    return data
