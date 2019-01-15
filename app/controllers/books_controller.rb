class BooksController < ApplicationController

  def create
  	 @book = Book.all
     @book = Book.new(book_params)
  if @book.save
     flash[:notice]= "Book was successfully created."
     redirect_to book_path (@book.id)
  else
    @books = Book.all
    @book = Book.new
    render 'new'
  end
end

  def show
  	@book = Book.find(params[:id])
  end

  def index
  end

  def new
  	 @books = Book.all.order(id:"desc")
     @book = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  if book.update(book_params)
    flash[:notice] = "Book was successfully update."
  	redirect_to book_path(book.id)
  else
    @book = Book.all
    @book = Book.new
    render 'new'
  end
end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to new_book_path
  end

 private

 def book_params
 	 params.require(:book).permit(:title, :body)
 end
end