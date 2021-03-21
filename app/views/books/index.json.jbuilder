json.books @user_books do |book|
  json.book_id book.id
  json.user_id book.user_id
  json.title book.title
  json.author book.author
  json.pages book.pages
  json.category book.category
  json.current_chapter book.current_chapter
  json.completed book.completed
end
