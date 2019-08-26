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

def get_hit_on_name(name):

    url_root = 'https://xtools.wmflabs.org/articleinfo/en.wikipedia.org/'+name
    response = simple_get(url_root.format(name))
    
    if response is not None:
        html = BeautifulSoup(response, 'html.parser')

        hit_link = [a for a in html.select('a')
                      if a['href'].find('lastest-60') > -1]
        
        if len(hit_link) > 0:
            link_text = hit_link[0].text.replace(',', '')
            try:
                return int(link_text)
            except:
                log_error("couldn't parse {} as an `int`".format(link_text))

    log_error('No pageviews found for {}'.format(name))
    return None
'''
if __name__ == '__main__':
    print('Getting the list of names')
    names = get_name()
    print('... done')

    results = []

    print('Getting stats for each name...')

    for name in names:
        try:
            hits = get_hit_on_name(name)
            if hits is None:
                hits = -1
            results.append((hits, name))
        except: 
            results.append((-1, name))

    print('Done...')
    print(results)

'''

resp = get('https://xtools.wmflabs.org/articleinfo/en.wikipedia.org/Mathematical%20optimization/2019-03-15/2019-04-06')
print(resp.content)
# raw_html = BeautifulSoup(resp, 'html.parser')
