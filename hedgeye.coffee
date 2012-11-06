# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

module.exports = (robot) ->
  robot.hear /./, (msg) ->
    if msg.message.user.name is 'nritsche'
      msg.send "#{msg.message.user.name}"
    if msg.message.user.name is 'boakes-hedgeye'
      msg.send "Hey ben"
    if msg.message.user.name is 'james.trevor.gary'
      msg.http('http://thecatapi.com/api/images/get.php').get() (err, res, body) ->
        try
          msg.send(body)
        catch error
        msg.send 'No cat photo for you!'
