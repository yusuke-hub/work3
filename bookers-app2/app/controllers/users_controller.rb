class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def create
    user = User.new(user_params)
    user.save
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
    # flash[:success] = 'Welcome! You have signed up successfully.'
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user info successfully.'
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end


protected
 def user_params
   params.require(:user).permit(:name,:profile_image,:introduction)
 end
 def book_params
   params.require(:book).permit(:title,:opinion)
 end
end

   # if @boook.user_id = current_user.id
   #    redirect_to edit_book_path(@boook)
   #  else
   #    render :show
   #  end    