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
<<<<<<< HEAD
  s = 'Brave Browser',
  d = 'iTerm',
  c = 'Fantastical 2',
  b = 'Bear'
=======
  b = 'Bear',
  g = 'Brave Browser'
>>>>>>> 35497b0347c9705447dd08dd85b334f35819240a
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    -- Launch or focus the application if its not focuses
    if (hs.application.frontmostApplication():name() ~= app)
    then
      hs.application.launchOrFocus(app)
    else
      -- Switch through the open windows for the application
      switcher = hs.window.switcher.new{app}
      switcher.ui.showSelectedThumbnail = false
      switcher.ui.showTitles = false
      switcher.ui.showThumbnails = false
      switcher:next()
    end
  end)
end
