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

def get_name():
    url = 'http://www.fabpedigree.com/james/mathmen.htm'
    response = simple_get(url)

    if response is not None:
        html = BeautifulSoup(response, 'html.parser')
        names = set()
        for li in html.select('li'):
            for name in li.text.split('\n'):
                if len(name) > 0:
                    names.add(name.strip())
    return list(names)

    raise Exception('Error retriving contents at {}'.format(url))

'''
### testing the beautifulsoup

raw_html = open('./contrived.html').read()
html = BeautifulSoup(raw_html, 'html.parser') # make the parse to html

print(type(html))

for p in html.select('p'):
    if p['id'] == 'walrus':
        print(p)

print('\n\n\n The mathematiciens\n\n')

raw_html = simple_get('http://www.fabpedigree.com/james/mathmen.htm')
html = BeautifulSoup(raw_html, 'html.parser')

for i, li in enumerate(html.select('li')):
    print(i, li.text)  

'''

print(get_name())