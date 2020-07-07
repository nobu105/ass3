class BooksController < ApplicationController
    before_action :authenticate_user!,except: [:about,:top]
  
  def index
        @book = Book.new
        @books = Book.all
        @user = @book.user
    end
    def create
        book = Book.new(book_params)
        book.user_id = current_user.id
                if  book.save
                    flash[:notice] = "successfully"
                    redirect_to book_path(book.id)
                else
                    flash.now[:alert] = 'error'
                    @books = Book.all
                    @book = book
                    render :index
                end
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @newbook = Book.new
    end
    def update
        @book = Book.find(params[:id])
                @book.update(book_params)
             if @book.save
                flash[:notice] = "updated book successfully."
                redirect_to book_path(@book)
             else
                @user = current_user
                @books = Book.all
                flash[:notice]  = "error"
                render :edit
             end
    end
    def edit
        @book=Book.find(params[:id])
        if  @book.user_id == current_user.id
            render :edit
        else
            redirect_to books_path
        end
    end
    def top
    end
    def about
    end

    private
    def book_params
        params.require(:book).permit(:title,:body,:user_id)
    end
end