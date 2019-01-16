# Include printing helper functions
source ~/.dotfiles/helpers.sh

##############################################################################
title "CLI Tools"
##############################################################################
if [[ $(which brew) == "" ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install zsh
brew install getantibody/tap/antibody
brew install diff-so-fancy
brew install homebrew/cask-fonts/font-source-code-pro

##############################################################################
title "Security"
##############################################################################
# Based on:
# https://github.com/drduh/macOS-Security-and-Privacy-Guide
# https://benchmarks.cisecurity.org/tools2/osx/CIS_Apple_OSX_10.12_Benchmark_v1.0.0.pdf

# Enable firewall. Possible values:
#   0 = off
#   1 = on for specific sevices
#   2 = on for essential services
subtitle "Enable firewall"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Source: https://support.apple.com/kb/PH18642
subtitle "Enable firewall stealth mode (no response to ICMP / ping requests)"
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

subtitle "Disable remote apple events"
sudo systemsetup -setremoteappleevents off

subtitle "Disable remote login"
# Automatically says yes to following warning
# Do you really want to turn remote login off? If you do, you will lose this connection and can only turn it back on locally at the server (yes/no)?
echo yes | sudo systemsetup -setremotelogin off

subtitle "Disable wake-on modem"
sudo systemsetup -setwakeonmodem off

subtitle "Disable wake-on LAN"
sudo systemsetup -setwakeonnetworkaccess off

subtitle "Disable guest account login"
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

subtitle "Disable Bonjour multicast advertisements"
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true

###############################################################################
title "Trackpad, mouse, keyboard, Bluetooth accessories, and input"
###############################################################################

subtitle "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

subtitle "Set a fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

###############################################################################
title "Configuring the Screen"
###############################################################################

subtitle "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

subtitle "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

subtitle "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

subtitle "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

subtitle "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

###############################################################################
title "Finder Configs"
###############################################################################

subtitle "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

subtitle "Allow text selection in Quick L"
defaults write com.apple.finder QLEnableTextSelection -bool true

subtitle "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

subtitle "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

subtitle "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

subtitle "Show the ~/Library folder"
chflags nohidden ~/Library

###############################################################################
title "Dock & Dashboard"
###############################################################################

subtitle "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

subtitle "Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36

subtitle "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

subtitle "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

subtitle "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

subtitle "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

subtitle "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

subtitle "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

###############################################################################
title "Configuring Safari & WebKit"
###############################################################################

subtitle "Set Safari’s home page to ‘about:blank’ for faster loading"
defaults write com.apple.Safari HomePage -string "about:blank"

subtitle "Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

subtitle "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

subtitle "Make Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

subtitle "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

subtitle "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
title "Configuring Mail"
###############################################################################

subtitle "Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

subtitle "Display emails in threaded mode, sorted by date (oldest at the top)"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

subtitle "Disable inline attachments (just show the icons)"
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
