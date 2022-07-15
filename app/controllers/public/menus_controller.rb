class Public::MenusController < ApplicationController
  def new
    @post1 = Post.new
    @menu = Menu.new
    @theme = @menu.themes.build
    @content = @theme.contents.build
  end
  
  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to menu_path(@menu)
  end 
  
  def edit
  end

  def show
  end 
  
  def destroy
  end 
  
  def update
  end 
  
  private
  
  def menu_params
    
    params.require(:menu).permit(:title, :dating, :is_active, theme_attributes: [:menu_id, :style, :_destroy, content_attributes: [:theme_id, :meter, :repeat, :set, :second, :detail, :_destroy]])
    
  end 

  
end
