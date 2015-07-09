module.exports = (robot) ->
  robot.brain.autoSave = true

  robot.hear /^logger add (.+)$/, (msg) ->
    logger = robot.brain.get("logger/#{msg.message.room}") || []
    logger.push(msg.match[1])
    robot.brain.set("logger/#{msg.message.room}", logger)

  robot.hear /^logger random$/i, (msg) ->
    logger = robot.brain.get("logger/#{msg.message.room}") || []
    user = logger[Math.floor(Math.random()*logger.length)]
    msg.send "#{user}"
