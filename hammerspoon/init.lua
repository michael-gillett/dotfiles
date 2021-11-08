local hyper = { "cmd", "alt", "ctrl", "shift" }

-- Reload hammerspoon config
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

hs.window.animationDuration = 0
-- START Window movement controls
hs.hotkey.bind(hyper, "z", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "x", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToScreen(win:screen():next())
end)

hs.hotkey.bind(hyper, "c", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind(hyper, "v", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.right50)
end)
-- END Window movement controls

-- START Spotfiy Controls
hs.hotkey.bind(hyper, "left", function()
  hs.spotify.setPosition(hs.spotify.getPosition() - 15)
end)

hs.hotkey.bind(hyper, "right", function()
  hs.spotify.setPosition(hs.spotify.getPosition() + 15)
end)
-- END Spotify Controls

-- Alert with the J muni predicition times
hs.hotkey.bind(hyper, "9", function()
  hs.http.asyncGet('http://webservices.nextbus.com/service/publicJSONFeed?command=predictions&a=sf-muni&r=J&s=6994', nil, function(status, body, headers)
    local json = require "json"
    res = json:decode(body)
    preds = res.predictions.direction.prediction
    res = "J Out: "
    for i, p in pairs(preds) do
      res = res .. os.date("%I:%M", os.time() + p.seconds):gsub(" 0"," ")
      if i == 3 then
        break
      else
        res = res .. ", "
      end
    end
    hs.alert.show(res, 5)
  end)
end)

-- App Specific shortcuts
local applicationHotkeys = {
  w = 'net.shinyfrog.bear',
  a = 'com.microsoft.VSCode',
  s = hs.urlevent.getDefaultHandler('http'),
  d = 'com.googlecode.iterm2',
  f = 'com.tinyspeck.slackmacgap',
  g = 'com.spotify.client'
}

for key, app in pairs(applicationHotkeys) do
  hs.tabs.enableForApp(app)
  hs.hotkey.bind(hyper, key, function()
    -- Launch or focus the application if its not focuses
    if (hs.application.frontmostApplication():name() ~= app)
    then
      hs.application.launchOrFocusByBundleID(app)
    else
      a = hs.application.applicationsForBundleID(app)
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
