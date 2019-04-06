from bs4 import BeautifulSoup
from requests import get
from pymongo import MongoClient
import re
import json

#try to connect to database
client = MongoClient('mongodb://jobs:j12345@ds163530.mlab.com:63530/uni-grade')
db = client['uni-grade']
collection = db['course']

def get_course():

    # for campus in range(4):
        list_courses = []

        response = get('https://matriculaweb.unb.br/graduacao/curso_rel.aspx?cod={}'.format(4))
        if response.status_code == 200:

            raw_html = BeautifulSoup(response.content, 'html.parser')

            tableHeadList = []

            for table_head in raw_html.select('th'):
                tableHeadList.append(str(table_head.text))
            
            for table_row in raw_html.select('tr'):
                course_atributes = {}
                for table_data in table_row.select('td'):
                    
                    if str(table_data.text) == '':
                        break

                    course_atributes[tableHeadList[0]] = str(table_data.text)
                    aux = tableHeadList[0]
                    tableHeadList.pop(0)
                    tableHeadList.append(aux)
                
                if course_atributes != {}:
                    list_courses.append(course_atributes)
                
        print(list_courses)
        collection.insert_many(list_courses)
            
                
                
get_course()




    

