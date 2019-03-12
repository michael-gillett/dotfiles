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
  f = 'Slack',
}

for key, app in pairs(applicationHotkeys) do
  hs.tabs.enableForApp(app)
  hs.hotkey.bind(hyper, key, function()
    -- Launch or focus the application if its not focuses
    if (hs.application.frontmostApplication():name() ~= app)
    then
      hs.application.launchOrFocus(app)
    else
      a = hs.appfinder.appFromName(app)
      ws = hs.tabs.tabWindows(a)

      -- Find the current tab index
      curr_tab_i = 1
      for i, w in pairs(ws) do
        if (w == a:focusedWindow()) then
          curr_tab_i = i
        end
      end

      -- Get the next tab index
      next_tab_i = curr_tab_i + 1
      if next_tab_i > #ws then
        next_tab_i = 1
      end

      -- Focus the new tab
      ws[next_tab_i]:focus()
    end
  end)
end
