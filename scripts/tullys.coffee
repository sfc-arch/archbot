module.exports = (robot) ->
  robot.hear /^カフェラテ$/, (msg) ->
    msg.send "350円"
