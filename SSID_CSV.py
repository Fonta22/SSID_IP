import glob
import sys

def getData(file, csv):
    xml = open(file)
    xml = xml.read()

    lines = xml.split('\n')

    for line in lines:
        if 'keyMaterial' in line:
            keyLine = line
        if 'name' in line:
            nameLine = line
        if 'protected' in line:
            protectedLine = line

    try:
        key = keyLine.replace('\t', '').replace('<keyMaterial>', '').replace('</keyMaterial>', '')
    except:
        key = ''

    name = nameLine.replace('\t', '').replace('<name>', '').replace('</name>', '')

    try:
        protected = protectedLine.replace('\t', '').replace('<protected>', '').replace('</protected>', '')
        if protected == 'false':
            protected = False
        elif protected == 'true':
            protected == True
    except:
        protected = True
    
    csv.write(f'{name},{key},{protected}\n')

if __name__ == '__main__':
    csv = open('SSID.csv', 'w')
    csv.write('Name,Key Material,Protected\n')

    # for all '.\Wi-Fi*.xml'
    try:
        files = glob.glob(f'{sys.argv[1]}/Wi-Fi*.xml')
    except:
        files = glob.glob('./Wi-Fi*.xml')

    for i in files:
        print(i.replace('/', '\\').replace('.\\', ''))
        getData(i, csv)
    
    print('\nExtracted data to .\SSID.csv')