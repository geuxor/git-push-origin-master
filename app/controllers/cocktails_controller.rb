class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [ :edit, :update, :edit, :show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    
  end
  
  def new
    @cocktail = Cocktail.new
  end

  def create # do with form
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
      # redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def edit
  end
  
  def update  # do with form
    find_cocktail
    
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'cocktail was successfully updated.'
      # redirect_to cocktail_path
    else
      render :edit
    end
  end
  

  def destroy
    find_cocktail
    @cocktail.destroy
    # no need for app/views/cocktails/destroy.html.erb
    redirect_to cocktails_path
  end

  
  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
