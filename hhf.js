const https = require('https');
const notifier = require('node-notifier');
const env = require("./.env/HHF.json");
let last = '';
function inline(data) {
    data = data.toString('UTF-8');
    dataObject = JSON.parse(data);
    if (dataObject.message) {
        console.log('TOKEN EXPIRED');
        return;
    }
    let i = 0;
    for (let obj in dataObject) {
        if (i == 0) {
            console.log(`[${dataObject[obj].short_id.toUpperCase()} ${dataObject[obj].author_name}] | font='JetBrains Mono NL'\n`);
            console.log('---');
            console.log(`${dataObject[obj].short_id.toUpperCase()} : ${dataObject[obj].author_name} : ${dataObject[obj].title} | font='JetBrains Mono NL'\n`);
            i++;
        } else {
            console.log(`${dataObject[obj].short_id.toUpperCase()} : ${dataObject[obj].author_name} : ${dataObject[obj].title} | font='JetBrains Mono NL'\n`);
        }
    }
}
function notify(data) {
    data = data.toString('UTF-8');
    dataObject = JSON.parse(data);
    if (dataObject.message) {
        notifier.notify({
            'title': '提交',
            'subtitle': '最新提交',
            'message': dataObject.message,
            sound: process.platform == 'darwin' ? 'Breeze' : true,
            timeout: 3600,
        });
        return;
    }
    let tmpLast = '';
    for (let obj in dataObject) {
        let id = dataObject[obj].short_id;
        let author = dataObject[obj].author_name;
        tmpLast = `${author}:${id}`;
        if (author == env.author) {
            tmpLast = last;
        }
        break;
    }
    if (tmpLast != last) {
        last = tmpLast;
        notifier.notify({
            'title': '提交',
            'subtitle': '最新提交',
            'message': last,
            sound: process.platform == 'darwin' ? 'Breeze' : true,
            timeout: 3600,
        });
    }
}
function ls(method) {
    https.get(env.gitlabUrl, { headers: { "PRIVATE-TOKEN": env.token, }, },
        res => {
            res.on('data', method);
        }
    ).on('error', console.log);
}
ls(env.method == 'inline' ? (process.platform == 'darwin' ? inline : notify) : notify);
