module.exports = (robot) ->
  robot.hear /^沼保$/, (msg) ->
    msg.send "壮太"
