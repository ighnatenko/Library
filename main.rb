require_relative "./controllers/library_controller.rb"

class Main
  def show_library
    lib = LibraryController.new
    lib.load_data

    popular_book = lib.most_popular_book
    puts "Most popular book: #{popular_book.title}"
    puts "\n"

    popular_reader = lib.popular_reader
    puts "Most popular reader: #{popular_reader.name}"
    puts "\n"

    lib.three_most_popular_books.each{ |key, value| puts "Popular book: #{key}" }
  end

  def load_test_data
    author1 = Author.new("name1", "biography1")
    author2 = Author.new("name2", "biography2")
    author3 = Author.new("name3", "biography3")
    author4 = Author.new("name4", "biography4")

    book1   = Book.new("book1", author1)
    book2   = Book.new("book2", author2)
    book3   = Book.new("book3", author3)
    book4   = Book.new("book4", author4)

    reader1 = Reader.new("Ivanov", "Ivanov@i.ua", "dnepr",    "reader1street", "3")
    reader2 = Reader.new("Petrov", "Petrov@i.ua", "lviv",    "reader2street", "5")
    reader3 = Reader.new("Sidorov", "Sidorov@i.ua", "kiev",     "reader3street", "12")

    order1  = Order.new(book1, reader1)
    order2  = Order.new(book1, reader1)
    order3  = Order.new(book1, reader1)
    order4  = Order.new(book2, reader2)
    order5  = Order.new(book2, reader2)
    order6  = Order.new(book3, reader3)
    order7  = Order.new(book4, reader3)


    lb = LibraryController.new
    lib = lb.load_data

    lb.add_author(author1)
    lb.add_author(author2)
    lb.add_author(author3)

    lb.add_book(book1)
    lb.add_book(book2)
    lb.add_book(book3)
    lb.add_book(book4)

    lb.add_reader(reader1)
    lb.add_reader(reader2)
    lb.add_reader(reader3)

    lb.add_order(order1)
    lb.add_order(order2)
    lb.add_order(order3)
    lb.add_order(order4)
    lb.add_order(order5)
    lb.add_order(order6)
    lb.add_order(order7)

    lb.save_data
  end
end