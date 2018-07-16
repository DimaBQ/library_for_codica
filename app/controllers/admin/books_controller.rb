class Admin::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :destroy]

  # GET /books
  # GET /books.json


  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to [:admin, @book], success: 'Книга была добавлена в библиотеку.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, danger: 'Книга не создана.' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to [:admin, @book], success: 'Книга была обновлена.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, danger: 'Книга не обновлена.' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, success: 'Книга была удалена из библиотеки.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :body, :image, :all_categories, :all_authors)
    end
end
