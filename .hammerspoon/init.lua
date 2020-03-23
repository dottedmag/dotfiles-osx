hs.window.animationDuration = 0

local columns = 3
local rows = 2

hs.grid.setGrid(hs.geometry(nil, nil, columns, rows))
hs.grid.setMargins(hs.geometry(nil, nil, 0, 0))

local function expand_left()
   hs.grid.adjustWindow(function(cell)
         if cell.x > 0 then
            cell.x = cell.x - 1
            cell.w = cell.w + 1
         end
   end)
end

local function shrink_left()
   hs.grid.adjustWindow(function(cell)
         if cell.w > 1 then
            cell.w = cell.w - 1
         end
   end)
end

local function expand_right()
   hs.grid.adjustWindow(function(cell)
         if cell.x+cell.w < columns then
            cell.w = cell.w + 1
         end
   end)
end

local function shrink_right()
   hs.grid.adjustWindow(function(cell)
         if cell.w > 1 then
            cell.x = cell.x + 1
            cell.w = cell.w - 1
         end
   end)
end

local function expand_up()
   hs.grid.adjustWindow(function(cell)
         if cell.y > 0 then
            cell.y = cell.y - 1
            cell.h = cell.h + 1
         end
   end)
end

local function shrink_up()
   hs.grid.adjustWindow(function(cell)
         if cell.h > 1 then
            cell.h = cell.h - 1
         end
   end)
end

local function expand_down()
   hs.grid.adjustWindow(function(cell)
         if cell.y+cell.w < columns then
            cell.h = cell.h + 1
         end
   end)
end

local function shrink_down()
   hs.grid.adjustWindow(function(cell)
         if cell.h > 1 then
            cell.y = cell.y + 1
            cell.h = cell.h - 1
         end
   end)
end

local function fullscreen()
   hs.grid.adjustWindow(function(cell)
         cell.x = 0
         cell.y = 0
         cell.w = columns
         cell.h = rows
   end)
end

hs.hotkey.bind({"cmd", "alt"}, "Left", expand_left)
hs.hotkey.bind({"cmd", "alt"}, "Right", expand_right)
hs.hotkey.bind({"cmd", "alt"}, "Down", expand_down)
hs.hotkey.bind({"cmd", "alt"}, "Up", expand_up)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", shrink_left)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", shrink_right)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", shrink_down)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", shrink_up)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Return", fullscreen)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
      hs.reload()
end)
hs.alert.show("Config reloaded")
