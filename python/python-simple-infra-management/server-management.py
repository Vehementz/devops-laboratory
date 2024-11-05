#! /bin/python3

### **Étape 1 : Créer une Liste de Serveurs**

servers = ["Web01", "DB01", "Cache01"]
servers.append("Cache02")
servers += ["Web02","DB02"]
# print(servers)

### **Étape 2 : Suivi de la Charge des Serveurs avec des dictionnaires**

servers_load = {
    "Web01": 45, 
    "DB01": 60, 
    "Cache01": 20,
    "Cache02": 0

}

# servers_load.update({"Cache02" : 50})
servers_load["Cache02"] = 50
servers_load["Web01"] = 70

print(servers_load)

### **Étape 3 : Automatiser la Surveillance avec des Boucles**

for index, (key, value) in enumerate(servers_load.items()):
    if (value > 80):
        print(f"The {key} server has a load superior at 80% !")

### **Étape 4 : Gestion Dynamique avec des Fonctions**

def add_server(dictionary, server_name, initial_load):
    return dictionary.update({server_name: initial_load})

add_server(servers_load, "Server_test", 40)

print(f"Test with a new server added : {servers_load}")

def check_load(dictionary, seuil):
    for index, (key, value) in enumerate(dictionary.items()):
        if (value > seuil):
            print(f"The {key} server has a load superior at the {seuil} !")

# check_load(servers_load, 30) ## To test the function ! 

def load_average(dictionary):
    dict_length = len(dictionary)
    total = sum(dictionary.values())
    average = total/dict_length
    return average
    ### Other way to do it below
    # value_init = 0
    # for index, (key, value) in enumerate(dictionary.items()):
    #     value_init += value
    # return value_init/dict_length

# print(load_average(servers_load))

### **Étape 5 : Optimiser et Étendre le Suivi avec des Conditions et Boucles Avancées**

def average_alert(dictionary, average_threshold):
    average_load = load_average(dictionary)
    if (average_load > average_threshold):
        print(f"The average load : {average_load} is greater than the average threshold : {average_threshold}")

average_alert(servers_load, 20)
# match()

def overload_management(server, load):
    match load:
        case _ if load > 90:
            print(f"Critical alert! The load on {server} is {load}, which exceeds the 90% threshold")
        case _ if 80 < load <= 90:
            print(f"Warning! The load on {server} is {load}, which is above the 80% threshold but below 90%")
        case _ if 50 < load <= 80:
            print(f"Moderate load on {server} is {load}, which is above the 80% threshold but below 80%")
        case _ if load < 50:
            print(f"Normal load")
        case _:
            print(f"Load on {server} is {load}%, which is within acceptable limits.")

overload_management(servers_load, 95)