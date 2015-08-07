json.(list, :title, :board_id, :ord)

if display_cards
  json.cards do
    json.array! (list.cards) do |card|
      json.partial! 'cards/card', card: card
  end
