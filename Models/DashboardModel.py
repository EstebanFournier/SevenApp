

from Models.PrincipalModel import PrincipalModel

class DashboardModel():

    def dayBookingM():
        url = "http://192.168.200.160:8000/api/booking/" + "2"
        response = PrincipalModel.get(url)
        #print('ModelApiRespone : ', response)
        return response
        