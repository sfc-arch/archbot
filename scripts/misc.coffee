module.exports = (robot) ->
  MEETING_CONTENTS_URL = 'https://api.github.com/repos/sfc-arch/documents/contents/meeting'

  robot.hear /^議事録$/i, (msg) ->
    robot.http(MEETING_CONTENTS_URL).get() (err, res, body) ->
      contents = JSON.parse body
      log = contents.pop()
      msg.send ":arrow_forward: #{log.html_url}"

  robot.hear /^お?弁当$/i, (msg) ->
    robot.http(MEETING_CONTENTS_URL).get() (err, res, body) ->
      contents = JSON.parse body
      log = contents[contents.length - 2]
      msg.send ":arrow_forward: http://bit.ly/14EIfNK"

  robot.hear /^lgtm$/i, (msg) ->
    robot.http("http://www.lgtm.in/g").header('Accept', 'application/json').get() (err, res, body) ->
      data = JSON.parse body
      msg.send data.actualImageUrl

  robot.hear /^whoami$/i, (msg) ->
      msg.send msg.message.user.name
