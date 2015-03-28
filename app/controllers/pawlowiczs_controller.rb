class PawlowiczsController < ApplicationController
  def new
    @quote = Quote.new
  end

  def index
    @quotes = Quote.all.order(vote: :desc).paginate(page: params[:page])
  end

  def newest
    @quotes = Quote.order(created_at: :desc).paginate(page: params[:page])
    render 'index'
  end

  def show
    @quote = Quote.find params[:id]
    @quote.increase_views!
  end

  def create
    @quote = Quote.new pawlowicz_params
    if @quote.save
      redirect_to pawlowicz_path(@quote.id)
    else
      render 'new'
    end
  end

  def random
    redirect_to pawlowicz_path(Quote.random.first)
  end

  private

  def pawlowicz_params
    params.require(:quote).permit(:body, :author)
  end
end
