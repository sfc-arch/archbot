# Description:
#   hubot anonymous post
#
# Commands:
#   hubot anon MESSAGE
#
# Author:
#   @ntddk

config =
  to: '#anonymous'
  log: 'anonymous_log'

module.exports = (robot) ->

  robot.respond /anon (.+)$/i, (msg) ->
    from = msg.message.user.name
    text = msg.match[1]
    to = config.to
    log = config.log
    robot.send {room: to}, text
    msg.send "@#{from} #{to} にこっそり「#{text}」って言っておきました"
    robot.send {room: log}, "@#{from} #{to} にこっそり「#{text}」って言っておきました"

  robot.respond /anon$/i, (msg) ->
    msg.send """
    hubot anon MESSAGE
    """
