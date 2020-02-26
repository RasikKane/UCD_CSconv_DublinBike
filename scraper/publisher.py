import pymysql
import cryptography

DB = {"S" : "dublin_bike_staticdata", "D" : "dublin_bike_dynamicdata"}
arg = {"S" : " VALUES (%s, %s, %s, %s, %s, %s,%s, %s)", "D" : " VALUES (%s, %s, %s, %s, %s, %s)"}

def connectDB():

    return pymysql.connect(host="localhost", user="root", password="localhost", database="t3", port=3306,\
                                      cursorclass=pymysql.cursors.DictCursor)

def publish(atr, val, table):
    print('hi',val)

    global DB, arg

    dublinBike_connect = connectDB()

    with dublinBike_connect.cursor() as cursor:

        sql = "INSERT INTO " + DB[table] + atr + arg[table]
        print(sql)
        cursor.executemany(sql,val)

    dublinBike_connect.commit()

    dublinBike_connect.close()


def Check_StaticEntry(number, table):

    global DB

    dublinBike_connect = connectDB()

    with dublinBike_connect.cursor() as cursor:
        sql = "SELECT number from " + DB[table] + " where number = %s"
        cursor.execute(sql,number)
        dublinBike_connect.close()
        return cursor.rowcount == 1
