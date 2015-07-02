module.exports = (robot) ->
  robot.hear /^calfol$/, (msg) ->
    msg.send "https://calfol.com :calfol:"
