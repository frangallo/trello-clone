class Api::CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render 'show'
    else
      render json: @card.errors.full_messages, status: 422
    end
  end

  def index
    @cards = Card.all
    render "index"
  end


  def show
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      render "show"
    else
      render json: @card.errors.full_messages, status: 422
    end
  end

  def destroy
    @card = card.find(params[:id])
    @card.destroy
    render "show"
  end

  private

  def card_params
    params.require(card).permit(:title, :description)
  end
end
