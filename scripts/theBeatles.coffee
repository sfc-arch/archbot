module.exports = (robot) ->
  robot.hear /Paul$/, (msg) ->
    msg.send "MacCartney"
