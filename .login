os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

--Print On Center Function

function printCenter(y,s)
    local x = math.floor(((w - string.len(s)) /2) + 1)
    term.setCursorPos(x,y)
    term.clearLine()
    term.write(s)
end

--Draws Menu Function

local desiredUsername = ""
local desiredPassword = ""

local nOption = 1
term.setPaletteColor(colors.blue, 0x0000ff)

local function drawMenuGraphics()
	term.setBackgroundColor(colors.blue)
	term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    term.write("DDE Login Screen")
    
    term.setCursorPos(w-13,1)
    if nOption == 1 then
     term.write("Enter Username")
    elseif nOption == 2 then
     term.write("Enter Password")
    else
     end
end

term.clear()
local function drawFrontend()
   term.setTextColor(colors.black)
   term.setBackgroundColor(colors.white)
   printCenter( math.floor(h/2) - 7, "")
   printCenter( math.floor(h/2) - 6, "Login")
   printCenter( math.floor(h/2) - 5, "")
   printCenter( math.floor(h/2) - 4, "")
   printCenter( math.floor(h/2) - 3, "")
   printCenter( math.floor(h/2) - 2, "    ________                      ")
   printCenter( math.floor(h/2) - 1, "   / ______ \\    Username:        ")
   printCenter( math.floor(h/2) + 0, "   || _  _ ||                     ")
   printCenter( math.floor(h/2) + 1, "   ||| || |||    Password:        ")
   printCenter( math.floor(h/2) + 2, "   |||_||_|||                     ")
   printCenter( math.floor(h/2) + 3, "   || _  _o||                     ")
   printCenter( math.floor(h/2) + 4, "   ||| || |||                     ")
   printCenter( math.floor(h/2) + 5, "   |||_||_|||      ^~^  ,         ")
   printCenter( math.floor(h/2) + 6, "   ||______||     ('Y') )         ")
   printCenter( math.floor(h/2) + 7, "  /__________\\    /   \\/          ")
   printCenter( math.floor(h/2) + 8, "__|__________|__ (\\|||/) __       ")
   printCenter( math.floor(h/2) + 9, "")
   printCenter( math.floor(h/2) + 10, "")
end

drawMenuGraphics()
drawFrontend()

while true do
   if nOption == 1 then
		term.setCursorPos(35, 8)
		desiredUsername = read()
		nOption = 2
		break
	end
end
while true do
	if nOption == 2 then
		term.setCursorPos(35, 10)
		desiredPassword = read()
		nOption = 3
		break
	end
end

local loginStep = 1

if nOption == 3 then
    local userfile1 = fs.open(".loginInformation/.username", "r")
	local userfile2 = fs.open(".loginInformation/.password", "r")
	local readUserfile1 = userfile1.readAll()
	local readUserfile2 = userfile2.readAll()
    if loginStep == 1 then
	    if desiredUsername == readUserfile1 and desiredPassword == readUserfile2 then
		    term.setCursorPos(26, 11)
		    write("Logging In...")
		    sleep(1.75)
		    term.setCursorPos(26, 12)
		    write("Success!")
		    sleep(2)
		    term.clear()
		    term.setCursorPos(1,1)
		    shell.run("DDE/.start")
	    else
		    term.setCursorPos(26, 11)
		    write("Logging In...")
		    sleep(1.75)
		    term.setCursorPos(26, 12)
		    write("Login Failed, Try Again")
		    sleep(2)
		    shell.run("DDE/.login")
	    end
    	    userfile1.close()
    	    userfile2.close()
    end
end

term.clear()

if nOption == 1 then
term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
	term.clear()
	term.setCursorPos(1,1)
	print("Shutting Down Doors")
	sleep(1)
	os.shutdown()
elseif nOption == 2 then
term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
	term.clear()
	term.setCursorPos(1,1)
	print("Rebooting Doors")
	sleep(1)
	os.reboot()
end
