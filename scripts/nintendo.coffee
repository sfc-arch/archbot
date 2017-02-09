module.exports = (robot) ->
  robot.hear /^任天堂$/, (msg) ->
    msg.send "すばらしい会社ですね！"
  robot.hear /^ソニー$/, (msg) ->
    msg.send "最近寒くなってきましたね…"
