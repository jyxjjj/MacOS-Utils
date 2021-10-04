#!/bin/zsh

# <bitbar.title>SSH</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>DESMG</bitbar.author>
# <bitbar.author.github>jyxjjj</bitbar.author.github>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>false</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>false</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>
# <swiftbar.runInBash>true</swiftbar.runInBash>
source /Users/jyxjjj/.zshrc

echo "SSH | font='JetBrains Mono NL'"
echo "---"
cat "$SWIFTBAR_PLUGINS_PATH/../.env/SSH.ssh"
echo "---"
echo "edit | bash=code param0=$SWIFTBAR_PLUGINS_PATH/../.env/SSH.ssh "
echo "refresh | refresh=true "
echo "---"
echo "Copyright (C) DESMG | font='JetBrains Mono NL'"
echo "All Rights Reserved | font='JetBrains Mono NL'"
