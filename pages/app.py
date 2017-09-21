from validate_email import validate_email
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("index.html")

if __name__ == '__main__':
    app.run(debug=True)


@app.route('/login', methods=['GET', 'POST'])
def login():
    is_Successful_Login = False;
    if request.method == 'POST':
        username = request.form['user-name']
        password = request.form['password']
        #Ensure that the supplied username is either a valid username or a valid email address
        if valid_email(username) or valid_Login_Name(username):
            if is_correct_login_info(username, password):
                is_Successful_Login = True
    if is_Successful_Login:
        return render_template('dashboard.html')

@app.route("/about")
def about():
    return render_template("about/index.html")



def valid_email(email):
    """
    This function will be extended later to check if the email address already exists in the database 
    When a new user tried to sign up.
    :param email str: the enmail address supplied in the login, signup or reset password page page
    """
    return validate_email(email)


def valid_Login_Name(userName):
    """
    Function to check if a given login contains either all alphabets or both alphabets and numeric
    The App will only allow this type of login name e.g samuel, samuel17
    :param userName str: The username used to login or create a new account
    """
    is_Valid = userName.isalnum()
    #if isValid == False:
    #    ValueError ('Invalid Username\rUsername should only contain letters or letters and numbers.')
    return is_Valid

def is_correct_login_info(username, password):
    '''
    First check if the supplied username is an email address.
    If it is not an email address, checks if the username exists in the database and returns the password.
    Else if it is an email address checks if the email address exists and returns the password.
    Returns false if no matching email address or username or if the supplied password is incorrect
    '''
    is_email_address = valid_email(username)    

    #To be replaced by sql queries  for checking if the user exist in the database
    user_Password = 'password'
    user_Exists = True
    
    if user_Exists and password == user_Password:
        return True
    else:
        return False
   