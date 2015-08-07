json.array! @boards do |board|
  json.partial!('board', board: board, display_lists: false)
end
