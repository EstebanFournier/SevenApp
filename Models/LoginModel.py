
from Models.PrincipalModel import PrincipalModel

class LoginModel():
    
    def loginM(email, password):
        params = {"email": email, "password": password}
        url = "http://192.168.200.160:8000/api/login"
        return PrincipalModel.post(url, params)