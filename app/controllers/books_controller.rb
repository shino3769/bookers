
class BooksController < ApplicationController
  
  def index
  @book = Book.new
  @books = Book.all  
  end
  
  def new
  @book = Book.new
  @books = Book.all  
  end
  
  def create
     @book = Book.new(book_params)
    @books = Book.all  
   if @book.save 
    
     flash[:notice] = "Book was successfully save."
     redirect_to book_path(@book.id) 
   else
     render :index
   end
  end
 
  def destroy
    book = Book.find(params[:id])  
  if book.destroy  
    flash[:notice] = "Book was successfully destroy."
    redirect_to '/books'    
  else
  end
  end
  
  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end
    
  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)  
   else
      render :edit
   end
  end
   
private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end