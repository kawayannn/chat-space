json.array! @messages do |message|
  json.content message.content
  json.image message.image.url
  json.created_at message.created_at.strftime("%Y/%m/%d %H:%M")
  json.id message.id
  json.name message.user.name
end