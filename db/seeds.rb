# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.delete_all
Author.delete_all
Authorship.delete_all

book_list = []

50.times do
  Book.create(
    title: Faker::Book.title,
    genre: Faker::Book.genre,
    classification: Book.classifications.sample,
    book_type: Book.book_types.sample,
    year: rand(1900..2018)
  )
end

25.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(14,70)
  )
end

book_list=[]

Book.all.each do |book|
  book_list.push(book)
end

author_id_list=[]

Author.ids.each do |author_id|
  author_id_list.push(author_id)
end

Book.all.each do |book|
  Authorship.create(
    book_id: book.id,
    author_id: author_id_list.sample
  )
end
