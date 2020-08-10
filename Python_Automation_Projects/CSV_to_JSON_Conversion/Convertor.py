#importing required libraries
import os
import csv, json

#declaring folders and paths
Current_Dir=os. getcwd()
CSV_InputDir = Current_Dir + "/" + "Input"
CSV_ProcessedDir = Current_Dir + "/" + "Processed/"
csvFilePath = CSV_InputDir
jsonFilePath = CSV_ProcessedDir + ".json"

# conversion
arr = []
with open (csvFilePath) as csvFile:
    csvReader = csv.DictReader(csvFile)
    for csvRow in csvReader:
        arr.append(csvRow)
        
# write the data to a json file
with open(jsonFilePath, "w") as jsonFile:
    jsonFile.write(json.dumps(arr, indent = 4))
    
with open(jsonFilePath, "a") as jsonFile:
    jsonFile.write("\n}")

with open(jsonFilePath, "r") as jsonFile , open(JsonPath, "w") as ultimateFile:
    ultimateFile.write("{\n    \"instances\": ")
    for line in jsonFile:
        ultimateFile.write(line)