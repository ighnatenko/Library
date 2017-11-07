require_relative "book.rb"
require_relative "order.rb"
require_relative "reader.rb"
require_relative "author.rb"

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize(books=[], orders=[], readers=[], authors=[])
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end
end