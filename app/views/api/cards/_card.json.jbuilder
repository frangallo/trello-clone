json.(card, :title, :description, :ord, :list_id)

if display_items
  json.items do
    json.array! (card.items) do |item|
      json.partial! 'items/item', item: item
  end
