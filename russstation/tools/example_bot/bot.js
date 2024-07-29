const http2byond = require("http2byond"); // https://github.com/tigercat2000/http2byond

const form = {
    ip: "127.0.0.1",
    port: "1"
};

let connection = http2byond.createTopicConnection(form);

connection.send("twitch_event=Tsay&msg=hoo&key=_CHANGE_THIS_")
connection.send("twitch_event=meteor&msg=emp&key=_CHANGE_THIS_")
