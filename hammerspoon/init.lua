local hyper = { "cmd", "alt", "ctrl", "shift" }
hs.alert.defaultStyle.atScreenEdge = 2

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
<<<<<<< HEAD
  win:moveToUnit(hs.layout.right50)
end)
-- END Window movement controls

-- START Spotfiy Controls
hs.hotkey.bind(hyper, "left", function()
=======
-- START Spotfiy Controls
hs.hotkey.bind(hyper, "left", function()
  print(hs.spotify.getPosition())
>>>>>>> 612cf2cc8ead739e009edea69c40ed99340d0389
  hs.spotify.setPosition(hs.spotify.getPosition() - 15)
end)

hs.hotkey.bind(hyper, "right", function()
<<<<<<< HEAD
=======
  print(hs.spotify.getPosition())
>>>>>>> 612cf2cc8ead739e009edea69c40ed99340d0389
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
      res = res .. p.minutes
      if i ~= 5 then
        res = res .. ", "
      end
    end
    hs.alert.show(res, 3)
  end)
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
