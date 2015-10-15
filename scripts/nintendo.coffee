module.exports = (robot) ->
  robot.hear /^abcd$/, (msg) ->
    msg.send "efgh"
