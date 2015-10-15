module.exports = (robot) ->
  robot.hear /^konokaSSK$/, (msg) ->
    msg.send "Twitterたのしい"

