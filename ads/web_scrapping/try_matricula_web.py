from bs4 import BeautifulSoup
from requests import get
from pymongo import MongoClient
import re
import json

# try to connect to database
client = MongoClient('mongodb://jobs:j12345@ds163530.mlab.com:63530/uni-grade')
db = client['uni-grade']
collection = db['course']

def get_course():

    # for campus in range(4):
        list_courses = []

        response = get('https://matriculaweb.unb.br/graduacao/curso_rel.aspx?cod={}'.format(4))
        if response.status_code == 200:

            # Make the parse for html
            raw_html = BeautifulSoup(response.content, 'html.parser')

            # Table head comment guide in table
            tableHeadList = []

            # Select all the th in html parser
            for table_head in raw_html.select('th'):
                tableHeadList.append(str(table_head.text))
            
            # Select all the rows in html 
            for table_row in raw_html.select('tr'):
                course_atributes = {}
                
                # In all rows we take the data
                for table_data in table_row.select('td'):
                    
                    if str(table_data.text) == '':
                        break

                    # Creating the dictionarie with the first element in table head list and data table text
                    course_atributes[tableHeadList[0]] = str(table_data.text)

                    # Take off the first element in list and adding in final from the same list (queue)
                    aux = tableHeadList[0]
                    tableHeadList.pop(0)
                    tableHeadList.append(aux)
                
                #Verify if the current course atribute is empty, if not append in list of course
                if course_atributes != {}:
                    list_courses.append(course_atributes)
                
        print(list_courses)

        # Make the insertion in mongodb (mlab)
        collection.insert_many(list_courses)

            
                
                
get_course()




    

