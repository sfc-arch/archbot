github = new (require 'github')
  version: '3.0.0'
github.authenticate type: 'token', token: process.env['GITHUB_API_TOKEN'] if process.env['GITHUB_API_TOKEN']?

TARGET_USER = 'sfc-arch'
TARGET_REPO = 'documents'

module.exports = (robot) ->
  robot.hear /^issue\s+(.+)$/, (msg) ->
    title = msg.match[1]

    github.issues.create
      user: TARGET_USER
      repo: TARGET_REPO
      title: title
      labels: []

  robot.hear /^issues$/, (msg) ->
    github.issues.repoIssues
      user: TARGET_USER
      repo: TARGET_REPO
      state: 'open'
    , (err, issues) ->
      messages =
        for issue in issues
          ":exclamation: ##{issue.number} #{issue.title} #{issue.html_url}"
      msg.send messages.join("\n")
