import os
import mysql.connector
import json
from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return "App is up & running..!!"


@app.route("/db-check")
def db_check():

    db_list = []

    conn = mysql.connector.connect (user='sqladmin', password='Azure@3456',
                               host='server_address',buffered=True)
    
    cursor = conn.cursor()
    databases = ("show databases")
    cursor.execute(databases)
    for (databases) in cursor:
        print databases[0]
        db_list += databases[0]

    return f"<h1>list of db's: </h1> {str(db_list)}"


if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=80)