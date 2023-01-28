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

local nOption = 1
term.setPaletteColor(colors.blue, 0x0000ff)

local function drawMenuGraphics()
	term.setBackgroundColor(colors.blue)
	term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    term.write("DDE Version 0.4")
    
    term.setCursorPos(w-13,1)
    if nOption == 1 then
     term.write("      Shutdown")
    elseif nOption == 2 then
     term.write("        Reboot")
    elseif nOption == 3 then
     term.write("          Back")
    else
     end
end

term.clear()
local function drawFrontend()
   term.setTextColor(colors.black)
   term.setBackgroundColor(colors.white)
   printCenter( math.floor(h/2) - 4, "    ________")
   printCenter( math.floor(h/2) - 3, "   / ______ \")
   printCenter( math.floor(h/2) - 2, "   || _  _ ||")
   printCenter( math.floor(h/2) - 1, "   ||| || |||")
   printCenter( math.floor(h/2) + 0, "   |||_||_|||")
   printCenter( math.floor(h/2) + 1, "   || _  _o||")
   printCenter( math.floor(h/2) + 2, "   ||| || |||")
   printCenter( math.floor(h/2) + 3, "   |||_||_|||      ^~^  ,")
   printCenter( math.floor(h/2) + 4, "   ||______||     ('Y') )")
   printCenter( math.floor(h/2) + 5, "  /__________\    /   \/")
   printCenter( math.floor(h/2) + 6, "__|__________|__ (\|||/) __")
   printCenter( math.floor(h/2) + 7, "")
   printCenter( math.floor(h/2) + 8, "")
   printCenter( math.floor(h/2) + 9, "")
   printCenter( math.floor(h/2) + 10, "")
end

drawMenuGraphics()
drawFrontend()

while true do
    local e,p = os.pullEvent()
        if e == "key" then
            local key = p
            if key == keys.w or key == keys.up then
                if nOption > 1 then 
                    nOption = nOption - 1
                    drawMenuGraphics()
                    drawFrontend()
                end
            elseif key == keys.s or key == keys.down then
                if nOption < 3 then
                    nOption  = nOption + 1
                    drawMenuGraphics()
                    drawFrontend()
                end
        elseif key == keys.enter then
            break
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
elseif nOption == 3 then
	term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
    shell.run("DDE/.start")
end