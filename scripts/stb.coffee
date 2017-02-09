module.exports = (robot) ->
  robot.hear /^スターバックス$/, (msg) ->
    msg.send "意識高い"
robot.hear /^ドトール$/, (msg) ->
       msg.send "あんま金ない人"
robot.hear /^タリーズ$/, (msg) ->
       msg.send "変わり者"


