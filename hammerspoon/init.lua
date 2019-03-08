local hyper = { "cmd", "alt", "ctrl", "shift" }

-- Reload hammerspoon config
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()


-- Window navigation controls
hs.window.animationDuration = 0.1

hs.hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "j", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)

hs.hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.right50)
end)

-- App Specific shortcuts

local applicationHotkeys = {
  a = 'Atom',
  s = 'Brave Browser',
  d = 'iTerm',
  c = 'Fantastical 2',
  b = 'Bear'
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end
