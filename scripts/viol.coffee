module.exports = (robot) ->
  robot.hear /^わーい$/, (msg) ->
    msg.send "ねむりたい"
