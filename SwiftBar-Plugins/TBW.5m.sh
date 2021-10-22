#!/bin/zsh

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

# 载入取整函数所在模块
zmodload -i zsh/mathfunc
# 获取 S.M.A.R.T. 信息
result=`/opt/homebrew/bin/smartctl -A disk0 | grep "Data Units Written" | grep -o '\[.*\]' | grep -o '[0-9\.]\{0,\}[0-9]\{0,\} \(GB\|TB\)'`
# result 如 123 GB 或 1.00 TB
echo -e "[TBW $result] | font='JetBrains Mono NL'"
# 输出 如 [123 GB] 或 [1.00 TB]
echo "---"
# 判断是 TB 还是 GB
if [[ "$result" == *"TB"* ]] {
    # 如果是 TB 则
    # 获取数字部分 去掉 空格 和 TB
    resultInt=${result% TB*}
    # raw * 512 / (1000 ^ 3) = TB
    # 要算 每日 GB 数 所以要 乘 1000
    echo -e "$(( int($(($resultInt * 1000))) / $(($(($(date +%s) - 1630425600)) / 86400)))) GB/Day | font='JetBrains Mono NL'"
} else {
    # 如果是 GB 则
    # raw * 512 / (1000 ^ 3) = TB
    # 此处数字部分已是 GB 所以 取整后直接参与计算
    echo -e "$(( int($(($resultInt))) / $(($(($(date +%s) - 1630425600)) / 86400)))) GB/Day | font='JetBrains Mono NL'"
}
echo "---"
# 版权信息
echo "Copyright (C) DESMG | font='JetBrains Mono NL'"
echo "All Rights Reserved | font='JetBrains Mono NL'"
