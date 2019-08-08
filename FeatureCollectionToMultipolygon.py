import re
import csv

#Be sure to manually remove the text at the very beginning of the file up until the first string of "} }" to get the delimiting correct
f=open("GeoJSON.txt","r") #The name of the GeoJSON file you will be converting, save it is a text file first
stri = f.read()
li = re.split('coordinates": | } }',stri) #Split the file based on these delimiters and store it in an array
i = 1
o = open("Multipoly.txt", "w") #Write to a new output file
o.write('{"type": "Multipolygon","coordinates": [') #Format the beginning in accordance with a Multipolygon feature

while i <len(li):# Loop through the entire list you created
    o.write(li[i])
    o.write(",") 
    
    i = i+2 #Only write the coordinates
o.write("] }") # Close the file with proper formatting


