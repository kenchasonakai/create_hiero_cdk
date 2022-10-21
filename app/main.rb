require 'json'

def lambda_handler(event:, context:)
    hash = { A: ["1313F"], B: ["130C0"] , C: ["133A1"], D: ["130A7"], E: ["131CB"], F: ["13191"], G: ["133BC"], H: ["1339B"], I: ["131CB"], J: ["13193"], K: ["133A1"], L: ["130ED"], M: ["13153"], N: ["13216"], O: ["1336F"], P: ["133E4"], Q: ["133D8"], R: ["1308B"], S: ["132F4"], T: ["133CF"], U: ["13171"], V: ["13191"],W: ["13171"], X: ["133A1", "132F4"], Y: ["131CB"], Z: ["13283"] }
    text = get_text(event)
    result = text && text.upcase.split("").map{ |string| hash[string.to_sym] ? hash[string.to_sym].map{ |s| s.hex.chr(Encoding::UTF_8)} : string }.join
    { statusCode: 200, body: result }
end

def get_text(event)
  if event["requestContext"]["http"]["method"] == "POST"
    JSON.parse(event["body"])["text"].to_s
  elsif event["requestContext"]["http"]["method"] == "GET"
    event["rawQueryString"].split("&").map{ |string| string.split("=") }.to_h["text"]
  end
end
