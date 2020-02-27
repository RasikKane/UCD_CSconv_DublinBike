import json

data  = {

    "president": {
        "name": "Zaphod Beeblebrox",
        "species": "Betelgeusian"
    }
}
with open("basic.json","w") as write_file:
    json.dump(data, write_file)

json.dumps(data)