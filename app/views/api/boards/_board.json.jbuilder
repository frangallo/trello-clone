json.(board, :title,:user_id)

if display_list
  json.lists do
    json.array! (board.lists) do |list|
      json.partial! 'lists/list', list: list
  end
