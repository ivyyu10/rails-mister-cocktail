class CocktailsController < ApplicationController
  # before_action :set_cocktail, only [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    set_cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: "Cocktail successly created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.save
      redirect_to @cocktail, notice: "Cocktail successfully updated!"
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
