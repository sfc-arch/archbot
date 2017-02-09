module.exports = (robot) ->
  robot.hear /^水瀬$/, (msg) ->
    msg.send "いのり"
    robot.hear /^佐倉$/, (msg) ->
    msg.send "綾音"
    robot.hear /^友利$/, (msg) ->
    msg.send "奈緒"
