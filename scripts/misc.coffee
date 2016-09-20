module.exports = (robot) ->
  MEETING_CONTENTS_URL = 'https://api.github.com/repos/sfc-arch/documents/contents/meeting'

  robot.hear /^議事録$/i, (msg) ->
    robot.http(MEETING_CONTENTS_URL).get() (err, res, body) ->
      contents = JSON.parse body
      log = contents.pop()
      msg.send ":arrow_forward: #{log.html_url}"

  robot.hear /^lgtm$/i, (msg) ->
    robot.http("http://www.lgtm.in/g").header('Accept', 'application/json').get() (err, res, body) ->
      data = JSON.parse body
      msg.send data.actualImageUrl

  robot.hear /^whoami$/i, (msg) ->
    msg.send msg.message.user.name

  robot.hear /^random\s*(.+)$/, (msg) ->
    choice = msg.match[1].split(" ")
    msg.send msg.random choice
    
  robot.hear /^ORFまで$/, (msg) ->
    diff = 1479394800000 - Date.now();
    remain = Math.ceil(diff / 1000 / 60 / 60 / 24)
    msg.send "*あと#{remain}日 :exclamation: *"
    
  robot.hear /^卒論まで$/, (msg) ->
    diff = 1482332400000 - Date.now();
    remain = Math.ceil(diff / 1000 / 60 / 60 / 24)
    msg.send "*卒論仮綴じ(12/22)まであと#{remain}日 :exclamation: *"
    
