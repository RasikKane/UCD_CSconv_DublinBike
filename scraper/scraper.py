import pymysql
import cryptography
# Open database connection
dublinBike_connect = pymysql.connect(host="localhost", user="root", password="localhost", database="db_24_2_1933", port=3306,\
                                      cursorclass=pymysql.cursors.DictCursor)


with dublinBike_connect.cursor() as cursor:
    # Create a new record
    sql = "INSERT INTO `dublin_bike_dynamicdata` (`number`, `status`) VALUES ('7','open')"
    cursor.execute(sql)

# connection is not autocommit by default. So you must commit to save
# your changes.
dublinBike_connect.commit()

with dublinBike_connect.cursor() as cursor:
    # execute SQL query using execute() method.
    sql = "SELECT `available_bike_stands`, `last_update` FROM `dublin_bike_dynamicdata` WHERE `number`=%s"
    cursor.execute(sql,('3'))

    # Fetch a single row using fetchone() method.
    data = cursor.fetchone()
    print ("Database version : %s " % data)

# disconnect from server
dublinBike_connect.close()
