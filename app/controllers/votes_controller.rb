class VotesController < ApplicationController
  def create
    @quote = Quote.find params[:pawlowicz_id]
    @positive = (params[:positive] == "true")
    if n = @quote.votes.where(ip: request.remote_ip).first
      @vote = n
      if @vote.positive == @positive
        return respond_to do |format|
          format.json { render json: { error: "Nie dla psa" }, status: 422 }
          format.html { redirect_to root_path }
        end
      else
        @vote.update_attribute(:positive, @positive)
      end
    else
      @vote = @quote.votes.build(positive: params[:positive],
                                 ip: request.remote_ip)
      @vote.save
    end
    respond_to do |format|
      format.js {  }
      format.json { render json: { ok: true } }
      format.html { redirect_to root_path }
    end
  end
end
