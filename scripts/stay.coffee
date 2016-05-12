module.exports = (robot) ->
  REDIS_KEY_PREFIX = 'stay/user_id/'
  STAY_API_ENDPOINT = 'http://203.178.143.196:3080/offer'

  robot.brain.autoSave = true

  robot.respond /(残留|zanryuu?|stay)(\s*([0-9]*))?/i, (msg) ->
    if msg.match[2]
      studentId = msg.match[3]
      robot.brain.set("#{REDIS_KEY_PREFIX}#{msg.message.user.name}", studentId)
      msg.reply 'I remember you!'
    else
      studentId = robot.brain.get("#{REDIS_KEY_PREFIX}#{msg.message.user.name}") || null

      unless studentId?
        msg.reply 'You should be set studentId! Direct messages are also Ok. Ex) `@archbot stay 71300000`'
        return

      robot.http(STAY_API_ENDPOINT)
        .header('Content-Type', 'application/x-www-form-urlencoded')
        .post("studentID=#{studentId}") (err, res, body) ->
          msg.reply 'Success!'
