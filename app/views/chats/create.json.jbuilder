json.user_name @chat.user.name
json.created_at @chat.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @chat.content
json.image @chat.image_url
json.user_id @chat.user.id
json.user_image_url @chat.user.image_url
json.id @chat.id