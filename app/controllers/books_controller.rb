class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to '/books'
      flash[:notice]='Book Created!'
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by!(id: params[:id])
  end
    
  def update
    @book = Book.find_by!(id: params[:id])

    if @book.update(book_params)
      redirect_to '/books'
      flash[:notice]='Book updated!'
    else
      render :edit
    end
  end

    def destroy
      @book = Book.find_by!(id: params[:id])
      if @book.destroy
      redirect_to '/books'
      else
        render 'Record Not Found!'
      end
    end

  private

  def book_params
    params.require(:book).permit(:name, :price)
  end

end
