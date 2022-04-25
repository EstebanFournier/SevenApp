# Import packages
import requests

# Principal class model
class PrincipalModel():

    # Post function
    def post(url, params):
        request = requests.post(url, data=params)
        apiResponse = request.json()
        if apiResponse['user']['email'] == params['email']:
            return apiResponse
        else :
            return "Bad creds"

    # Get function
    def get(url):
        request = requests.get(url)
        api_response = request.json()
        #print('PModelApiResponse : ', api_response)
        return api_response
    
    # Put function
    def put(url, params):
        request = requests.put(url, data=params)
        api_response = request.json()
        return api_response
    """ 
    # Get function
    def get(url):
        request = requests.post(url)
        api_response = request.json()
        return api_response
    # Get function
    def get(url):
        request = requests.post(url)
        api_response = request.json()
        return api_response 
        """