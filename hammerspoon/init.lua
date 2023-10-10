local hyper = { "cmd", "alt", "ctrl", "shift" }


HyperMode = hs.hotkey.modal.new({})

-- Enter Hyper Mode when F18 is pressed
local pressedF18 = function() HyperMode:enter() end

-- Leave Hyper Mode when F18 is released.
local releasedF18 = function() HyperMode:exit() end

hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- Reload hammerspoon config
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

HyperMode:bind({}, "0", function()
  hs.reload()
end)

hs.window.animationDuration = 0.05
-- START Window movement controls
HyperMode:bind({}, "z", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.left50)
end)

HyperMode:bind({}, "x", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToScreen(win:screen():next())
end)

HyperMode:bind({}, "c", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.maximized)
end)

HyperMode:bind({}, "v", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.right50)
end)
-- END Window movement controls

-- App Specific shortcuts
local applicationHotkeys = {
  w = 'net.shinyfrog.bear',
  a = 'com.microsoft.VSCode',
  s = hs.urlevent.getDefaultHandler('http'),
  d = 'com.apple.Terminal',
  f = 'com.tinyspeck.slackmacgap',
  g = 'com.DanPristupov.Fork'
}

for key, app in pairs(applicationHotkeys) do
  -- hs.tabs.enableForApp(app)
  HyperMode:bind({}, key, function()
    -- Launch or focus the application if its not focuses
    if (hs.application.frontmostApplication():name() ~= app)
    then
      hs.application.launchOrFocusByBundleID(app)
    -- else
    --   a = hs.application.applicationsForBundleID(app)
    --   ws = hs.tabs.tabWindows(a)

    --   -- Find the current tab index
    --   curr_tab_i = 1
    --   for i, w in pairs(ws) do
    --     if (w == a:focusedWindow()) then
    --       curr_tab_i = i
    --     end
    --   end

    --   -- Get the next tab index
    --   next_tab_i = curr_tab_i + 1
    --   if next_tab_i > #ws then
    --     next_tab_i = 1
    --   end

    --   -- Focus the new tab
    --   ws[next_tab_i]:focus()
    end
  end)
end
