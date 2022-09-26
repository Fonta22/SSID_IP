import sys

xml = open(sys.argv[1])
xml = xml.read()

lines = xml.split('\n')

for line in lines:
    if 'keyMaterial' in line:
        keyLine = line
    if 'name' in line:
        nameLine = line
    if 'protected' in line:
        protectedLine = line

key = keyLine.replace('\t', '').replace('<keyMaterial>', '').replace('</keyMaterial>', '')
name = nameLine.replace('\t', '').replace('<name>', '').replace('</name>', '')
protected = protectedLine.replace('\t', '').replace('<protected>', '').replace('</protected>', '')

if protected == 'false':
    protected = False
elif protected == 'true':
    protected == True

print(f'Name: {name}\nKey Material: {key}\nProtected: {protected}')