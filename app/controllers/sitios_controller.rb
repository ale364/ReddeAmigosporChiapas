class SitiosController < ApplicationController
  before_action :find_sitio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @sitios = Sitio.all.order("created_at ASC")
  end

  def show
    if @sitio.reviews.blank?
      @average_review = 0
    else
      @average_review = @sitio.reviews.average(:rating).round(2)
    end
  end

  def new
    @sitio = current_user.sitios.build
  end

  def create
    @sitio = current_user.sitios.build(sitio_params)
    if @sitio.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @sitio.update(sitio_params)
      redirect_to sitio_path(@sitio)
    else
      render 'edit'
    end
  end

  def destroy
    @sitio.destroy
    redirect_to root_path
  end

  private
    def sitio_params
      params.require(:sitio).permit(:title, :description, :author, :sitio_img)
    end
    def find_sitio
      @sitio = Sitio.find(params[:id])
    end
end
