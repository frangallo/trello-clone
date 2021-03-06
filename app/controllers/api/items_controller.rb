class Api::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render 'show'
    else
      render json: @item.errors.full_messages, status: 422
    end
  end

  def index
    @items = Item.all
    render "index"
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      render "show"
    else
      render json: @item.errors.full_messages, status: 422
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render "show"
  end

  private

  def item_params
    params.require(item).permit(:title, :done?)
  end
end
