module.exports = (robot) ->
  robot.hear /^blablabla$/, (msg) ->
    msg.send "pong"



