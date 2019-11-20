class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @boook = Book.find(params[:id])
    @user = User.find(@boook.user_id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have creatad book successfully."
    redirect_to book_path(@book.id)
  else 
    @books = Book.all
    @user = current_user
    render :index
  end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      flash[:success] ="error"
      redirect_to books_path
    end
  end

  def destroy
    @boook = Book.find(params[:id])
    if @boook.user_id = current_user.id
      @boook.destroy
      redirect_to books_path
    else
      render :show
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    render :edit
  end
  end
protected
 def book_params
   params.require(:book).permit(:title,:body)
 end
end

