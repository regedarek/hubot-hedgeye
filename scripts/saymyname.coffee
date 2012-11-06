# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

module.exports = (robot) ->
  robot.respond /cat me/i, (msg) ->
    Parser = require("xml2js").Parser
    #msg.send "#{msg.message.user.name}"
    msg.http('http://thecatapi.com/api/images/get?format=xml&results_per_page=20').get() (err, res, body) ->
      try
        (new Parser).parseString body, (err, json)->
          cat_image_url = JSON.stringify json.response.data[0].images[0].image[0].url[0]
          cat_image_url.replace("\"", "")
          msg.send(cat_image_url)
      catch error
        msg.send 'No cat photo for you!'


