module.exports = (robot) ->
  robot.hear /^test$/, (msg) ->
    msg.send "test"
