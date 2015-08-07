json.array! @cards do |card|
  json.partial!('card', card: card, display_items: false)
end
