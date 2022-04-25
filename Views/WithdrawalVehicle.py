from kivymd.app import MDApp
from kivymd.uix.screen import Screen
from kivymd.uix.datatables import MDDataTable
from kivy.metrics import dp
from kivy.uix.label import Label
from Controllers.DashboardController import DashboardController

from Views.Login import LoginView
#regarder les props

class withdrawalVehicleView(MDApp):

    def build(self):

        screen = Screen()

        """ agency_id = LoginView.agencyId()
        print('agency_id : ', agency_id) """
        apiResponse = DashboardController.dayBooingC()
        print('ViewApiRespone : ', apiResponse)

        for item in apiResponse:
            self.gl.add_widget(Label(text=str(item['id'])))
            self.gl.add_widget(Label(text=str(item['vehicle_id'])))


        self.theme_cls.theme_style = "Light"
        self.theme_cls.primary_palette = "BlueGray"
        #screen.add_widget(table)
        return screen

        """ liste = []
        i = 0
        for item in apiResponse:
            liste.append(apiResponse[i]["id"])
            liste.append(apiResponse[i]["vehicle_id"])
            i += 1

        print('liste : ', liste)

        table = MDDataTable(
            column_data = [
                ("id", dp(30)),
                ("booker_id", dp(30)),
            ],
            row_data = liste
        ) """