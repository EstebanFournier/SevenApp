# Import package

from Models.LoginModel import LoginModel

# Login class controller
class LoginController():

    def loginC(email, password):
        response = LoginModel.loginM(email, password)
        print(response)
        return response
        