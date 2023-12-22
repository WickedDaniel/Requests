import pydirectinput, time

## User Set
clients = 1 # Default
testrun = True
## Default Values
mouseCoords = []
afkSwitchTime = 0       # Cooldown till it activates another client
defaultSwitchTime = 600 # Default

def setClient():
    global clients
    try:
        clients = int(input("How many clients are opened (Default 1): "))
    except Exception:
        clients = 1




def moveMouseTo(index):
    x = mouseCoords[index]['x']
    y = mouseCoords[index]['y']
    pydirectinput.moveTo(x, y)
    pydirectinput.rightClick()
    pydirectinput.moveTo(x, y+1)
    pydirectinput.press("space")

def capturePosition():
    print("\n[MOUSE CAPTURE MODE]\n")
    for client in range(0, clients):
        for countdownSecond in range(3, 0, -1):
            print(f"Capturing mouse position in: {countdownSecond}", end =' \r')
            time.sleep(1)
        mouseCoords.append({'x': pydirectinput.position()[0], 'y': pydirectinput.position()[1]})
        print("\033[A\033[A")
        print(f"Captured Mouse Position {client}.\nPosition: {mouseCoords[client]}\n")
    print("\033[A\033[A")
    print("\r", end="")

def setDefaults():
    global afkSwitchTime
    if testrun == True:
        afkSwitchTime = 2.5
    else:
        afkSwitchTime = defaultSwitchTime/clients
    showDefaults()

def showDefaults():
    print("\n[DEFAULT SETTINGS DISPLAY]")
    print(f"AntiAFK Testrun: {testrun}")
    print(f"AntiAFK Switch Time: {afkSwitchTime}")
    print(f"AntiAFK Captured Coordinates: {len(mouseCoords)}")

def mainLoop():
    print("\n[ANTIAFK RUN]")
    global afkSwitchTime
    global testrun
    global defaultSwitchTime
    iclient = 0
    while True:
        if(iclient == len(mouseCoords)):
            iclient = 0
            if testrun == True:
                testrun = False
                afkSwitchTime = defaultSwitchTime/clients
                print("\n[ANTIAFK TESTRUN]")
                print(f"AntiAFK Testrun finished, set AFK Switch Time to: {afkSwitchTime}\n")

        moveMouseTo(iclient)
        print("Reactivated Client:", iclient)
        iclient += 1
        time.sleep(afkSwitchTime)

print("[ANTIAFK]")
print("Starting...")
time.sleep(1)
setClient()
capturePosition()
setDefaults()
mainLoop()


