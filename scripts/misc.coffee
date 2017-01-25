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
    
#   robot.hear /^ORFまで$/, (msg) ->
#     diff = 1479394800000 - Date.now();
#     remain = Math.ceil(diff / 1000 / 60 / 60 / 24)
#     msg.send "*あと#{remain}日 :exclamation: *"
    
  robot.hear /^卒論まで$/, (msg) ->
    dayTime = 24 * 60 * 60 * 1000;
    diff = 1485415800000 - Date.now()
    if 0 < diff
      h = Math.floor((diff % dayTime) / (60 * 60 * 1000)) 
      m = Math.floor((diff % dayTime) / (60 * 1000)) % 60 
      s = Math.floor((diff % dayTime) / 1000) % 60 % 60 
      msg.send "*卒論本綴じ(1/26 16:30)まであと#{h}時間#{m}分#{s}秒 :exclamation: *"
    else
      diff = 1486134000000 - Date.now()
      d = Math.floor(diff / dayTime) 
      msg.send "*卒論最終発表(2/4)まであと#{d}日 :exclamation: *"
