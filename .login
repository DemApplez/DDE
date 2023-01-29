os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

--Print On Center Function

function printCenter(y,s)
	local x = math.floor((w - string.len(s)) /2)
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
    local e,p = os.pullEvent()
    if e == "key" then
        local key = p
        if nOption == 1 then
			term.setCursorPos()
			desiredUsername = read()
			if key == keys.enter then
				nOption = 2
			end
		end
		if nOption == 2 then
			term.setCursorPos()
			desiredPassword = read()
			if key == keys.enter then
				nOption = 3
			end
		end
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