class Public::MenusController < ApplicationController
  before_action :authenticate_user!
  def new
    @post1 = Post.new
    @menu = Menu.new
    @theme = @menu.themes.build
    @content = @theme.contents.build
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id

    if @menu.save
      redirect_to menu_path(@menu)
    else
      render 'new'
    end
  end

  def edit
    @post1 = Post.new
    @menu = Menu.find(params[:id])
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.delete
    redirect_to request.referer
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
      redirect_to menu_path(@menu)
    else
      render 'edit'
    end

  end

  private

  def menu_params

    params.require(:menu).permit(:title, :dating, :is_active, themes_attributes: [:id, :menu_id, :style, :_destroy, contents_attributes: [:id, :theme_id, :meter, :repeat, :set, :second, :detail, :_destroy]])

  end


end
