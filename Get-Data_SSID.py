xml = open('Wi-Fi-Mi 11i.xml')
xml = xml.read()

lines = xml.split('\n')

for line in lines:
    if 'keyMaterial' in line:
        keyLine = line
    if 'name' in line:
        nameLine = line

key = keyLine.split('\t').pop().split('>')[1].split('<')[0]
name = nameLine.split('\t').pop().split('<name>').pop().split('</name>')[0]

print(name)