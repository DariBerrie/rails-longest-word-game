require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = 10.times.map { [('A'..'Z').to_a.sample] }
  end

  def score
    @api_url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
  end
end
