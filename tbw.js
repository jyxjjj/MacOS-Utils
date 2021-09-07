const cp = require('child_process');
const notifier = require('node-notifier');

const s = () => {
    cp.exec('/opt/homebrew/bin/smartctl -A disk0', { shell: '/bin/zsh' }, (err, stdout, stderr) => {
        let reg1 = /Data Units Written:\s+(.*)\s+\[(.*)\]/g.exec(stdout);
        let reg2 = /Percentage Used:\s+(.*)/g.exec(stdout);
        let tbw = '';
        let trm = '';
        if (reg1 != null) {
            tbw = reg1[2];
        }
        if (reg2 != null) {
            trm = reg2[1];
        }
        notifier.notify({
            'title': '硬盘报告',
            'subtitle': '硬盘报告',
            'message': `${tbw} | ${trm}`,
            sound: false,
            timeout: 10,
        });
    });
};
s();
setInterval(s, 1000 * 60 * 5);
