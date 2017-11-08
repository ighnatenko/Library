require_relative "../models/book.rb"
require_relative "../models/order.rb"
require_relative "../models/reader.rb"
require_relative "../models/author.rb"
require_relative "../models/library.rb"

require 'pp'
require 'marshal/structure'

class LibraryController
  attr_accessor :library

  def initialize
    @library = Library.new
  end

  def add_book book
    @library.books << book
  end

  def add_order order
    @library.orders << order
  end

  def add_reader reader
    @library.readers << reader
  end

  def add_author author
    @library.authors << author
  end

  def most_popular_book
    popular_order.book
  end

  def popular_reader
    popular_order.reader
  end

  def three_most_popular_books
    books = {}

    books_hash = @library.orders.each_with_object(Hash.new(0)) do |order, hash|
      hash[order.book.title] += 1
    end

    books_hash.max_by { |key, value| books[key] = value }
    books.first(3)
  end

  def load_data
    @library = File.open("./src/data.txt","rb") {|f| @library = Marshal.load(f)}
  end

  def save_data
    File.open("./src/data.txt","wb") do |file|
      Marshal.dump(@library,file)
    end
  end

  private
  def popular_order
    order_hash = @library.orders.each_with_object(Hash.new(0)) do |item, hash|
      hash[item] += 1
    end

    order_hash.max_by{|_, v| v}.first
  end
end