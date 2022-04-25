# Import kivy packages
from kivymd.app import MDApp
from kivy.lang import Builder
from kivymd.uix.dialog import MDDialog
from kivymd.uix.button import MDFlatButton

# Import controllers and views
from Controllers.LoginController import LoginController


class LoginView(MDApp):

    dialog = None

    def build(self):
        self.theme_cls.theme_style = "Dark"
        self.theme_cls.primary_palette = "BlueGray"
        return Builder.load_file('Views/login.kv')
        
    def logger(self):
        email = self.root.ids.user.text
        password = self.root.ids.password.text
        apiRequest = LoginController.loginC(email, password)
        print(apiRequest)
        self.root.ids.welcome_label.text = f'{apiRequest}'
        """ if not self.dialog:
                # create dialog
                self.dialog = MDDialog(
                    title="Log In",
                    text=f"Welcome {self.root.ids.user.text}!",
                    buttons=[
                        MDFlatButton(
                            text="Ok", text_color=self.theme_cls.primary_color,
                            on_release=LoginView.agencyId(apiRequest["user"]["agency_id"])
                        ),
                    ],
                ) """
        """  # open and display dialog
        self.dialog.open()
        return 
        
    def agencyId(params):
        print('agencyId : ', params)
        #return  """

    def clear(self):
        self.root.ids.welcome_label.text = "Bienvenue"		
        self.root.ids.user.text = ""		
        self.root.ids.password.text = ""