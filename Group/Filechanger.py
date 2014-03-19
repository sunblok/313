#!/usr/bin/python

# This is TCPClient.py
ing = []
with open("BigOven ingredients.txt") as f:
   for line in f:
      words = line.split(">")
      #print words[1]
      #print "test"
      name = words[1].split("<")
      #print name[0]
      ing.append(name[0])
f = open("ingredients.txt","w")
for ent in ing:
   #print ent
   f.write(",(\""+ent+"\")\n")
f.close();