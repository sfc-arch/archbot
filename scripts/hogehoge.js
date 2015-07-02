module.exports = function(robot) {
    robot.hear(/^hogehoge$/, function(msg) {
        msg.send("mogemoge");
    });
}
