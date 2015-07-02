module.exports = (robot) ->
  robot.hear /^king$/, (msg) ->
    msg.send "kong"
