import pymysql
import cryptography

DB = {"dBikeS" : "dublin_bike_staticdata", "dBikeD" : "dublin_bike_dynamicdata", "dWeatherD" : "open_weather_dynamicdata"}
arg = {"dBikeS" : " VALUES (%s, %s, %s, %s, %s, %s,%s, %s)", "dBikeD" : " VALUES (%s, %s, %s, %s, %s, %s)",\
        "dWeatherD" : " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,\
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"}

def connectDB():

    return pymysql.connect(host="localhost", user="root", password="localhost", database="t3", port=3306,\
                                      cursorclass=pymysql.cursors.DictCursor)

def publish(atr, val, table):

    global DB, arg

    dublinBike_connect = connectDB()

    with dublinBike_connect.cursor() as cursor:

        sql = "INSERT INTO " + DB[table] + atr + arg[table]
        cursor.executemany(sql,val)

    dublinBike_connect.commit()

    dublinBike_connect.close()


def Check_StaticEntry(attr, table):

    global DB

    dublinBike_connect = connectDB()

    with dublinBike_connect.cursor() as cursor:
        sql = "SELECT number from " + DB[table] + " where number = %s"
        cursor.execute(sql,attr)
        dublinBike_connect.close()
        return cursor.rowcount == 1
