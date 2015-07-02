module.exports = (robot) ->
  robot.hear /^hogehoge$/, (msg) ->
    msg.send "mogemoge"
