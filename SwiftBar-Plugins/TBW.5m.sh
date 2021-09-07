# <bitbar.title>TBW</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>DESMG</bitbar.author>
# <bitbar.author.github>jyxjjj</bitbar.author.github>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>false</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>false</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>
# <swiftbar.runInBash>true</swiftbar.runInBash>

echo -e "[TBW $(/opt/homebrew/bin/smartctl -A disk0 | grep "Data Units Written" | grep -o '\[.*\]' | grep -o '[0-9]\{2,\}') GB] | font='JetBrains Mono NL'"
echo "---"
function cacl(){
    local total=$(/opt/homebrew/bin/smartctl -A disk0 | grep "Data Units Written" | grep -o '\[.*\]' | grep -o '[0-9]\{2,\}');
    local dt=$(date +%s);
    local diff=$(($dt - 1630425600));
    local days=$(($diff / 86400));
    local per=$(($total / $days));
    echo $per;
}
echo -e "$(cacl) GB/Day | font='JetBrains Mono NL'"
echo "---"
echo "Copyright (C) DESMG | font='JetBrains Mono NL'"
echo "All Rights Reserved | font='JetBrains Mono NL'"
