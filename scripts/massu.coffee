module.exports = (robot) ->
  robot.hear /^はろー$/, (msg) ->
    msg.send "ハロー"
