module.exports = (robot) ->
  robot.hear /^pong$/, (msg) ->
    msg.send "ping"
