module.exports = (robot) ->
  robot.hear /^ping$/, (msg) ->
    msg.send "pong"
  robot.hear /^hey$/, (msg) ->
    msg.send "hoy"
