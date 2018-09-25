class QuotesController < ApplicationController
  def show
    @quote = Quote.order("RANDOM()").limit(1).first
  end
end
