from requests import get
from requests.exceptions import RequestException
from contextlib import closing
from bs4 import BeautifulSoup

def simple_get(url):
    try:
        with closing(get(url, stream=True)) as resp:
            if is_good_response(resp):
                return resp.content
                
            else:
                return None
    except RequestException as e:
        log_error('Error during request to {0} : {1}'.format(url, str(e)))
    

def is_good_response(resp):
    content_type = resp.headers['content-type'].lower()
    return(resp.status_code == 200)

def log_error(e):
    print(e)


test = simple_get('https://api.github.com/users/joberthrogers18')
print(test)

'''
response = get('https://api.github.com/users/joberthrogers18')
print(response.status_code)
response.headers['content-type']
print(response.content)
'''
 

