import json
import requests
from publisher import *
from datetime import datetime

staticAttribute = ['number', 'contract_name', 'name', 'address', 'position_lat', 'position_lng', 'bonus', 'banking']
dynamicAttribute = ['number', 'status', 'bike_stands', 'available_bike_stands', 'available_bikes']
tsD = {'Dynamic' : 'last_update'}

# File handling with python https://www.w3schools.com/python/python_file_open.asp
def api_URL():
    f = open("apiKey_dBike.txt", "r")
    contract_name = f.readline().rstrip('\n')
    api_key = f.readline().rstrip('\n')
    f.close()
    api_dBike_URL = "https://api.jcdecaux.com/vls/v1/stations?contract=" + contract_name + "&apiKey=" + api_key
    return api_dBike_URL

def check_DB_Attribute():
    pass

def check_instance(dictionary):
    if isinstance(resp_Fields[key],dict):
        return True
    else:
        return False

# flatten dictionary +sep+https://medium.com/better-programming/how-to-flatten-a-dictionary-with-nested-lists-and-dictionaries-in-python-524fd236365
def flatten(collection_input,sep="_"):
    dictionary = {}

    def recurse(coll_in,parent_key=""):
        if isinstance(coll_in,dict):
            for key,val in coll_in.items():
                recurse(val,parent_key+sep+key if parent_key else key)
        else:
            dictionary[parent_key] = coll_in
    recurse(collection_input)
    return dictionary


def insert_Data(api_dBike_Resp_json):
    att_st_final, val_st_final,att_dy_final, val_dy_final = '',[],'',[]
    DB_dict = {}

    for stations in range(len(api_dBike_Resp_json)):
        val_st, val_dy =[],[]

        DB_dict = flatten(api_dBike_Resp_json[stations])

        for attributeDy in dynamicAttribute:
            try:
                val_dy.append(DB_dict[attributeDy])
            except KeyError:
                val_dy.append(None)

        val_dy.append(datetime.fromtimestamp(int(DB_dict[tsD['Dynamic']] / 1000)))
        val_dy_final.append(val_dy)


        if not Check_StaticEntry(DB_dict['number'], "S"):
            for attributeSt in staticAttribute:
                try:
                    val_st.append(DB_dict[attributeSt])
                except KeyError:
                    val_st.append(None)
            val_st_final.append(val_st)
        else:
            continue

    att_st_final = "(`" + '`,`'.join(str(sAtt) for sAtt in staticAttribute) +  "`)"
    att_dy_final = "(`" + '`,`'.join(str(dAtt) for dAtt in dynamicAttribute) +"`,`last_update" + "`)"

    if val_st_final:
        publish(att_st_final,val_st_final,"S")
        print('ok')
    publish(att_dy_final,val_dy_final,"D")


def main():
    api_dBike_Resp = requests.get(api_URL())
    if api_dBike_Resp.status_code == 200 :
        insert_Data(api_dBike_Resp.json())

if __name__ == '__main__':
    main()
