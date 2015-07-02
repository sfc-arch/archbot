module.exports = (robot) ->
  robot.hear /^おはよう$/, (msg) ->
    msg.send "おやすみ！"
