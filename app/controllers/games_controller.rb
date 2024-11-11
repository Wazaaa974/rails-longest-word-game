require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
  @alphabet = ('a'..'z').to_a
  @letters = @alphabet.sample(10)
  end

  def score
    @available_letters = params[:grid].split()
    url = "https://dictionary.lewagon.com/#{params[:word]}"
    @word_serialized = URI.parse(url).read
    @word = JSON.parse(@word_serialized)
    @input = params[:word].split("")


   @included = @input.all? do |element|
      @available_letters.include?(element)
   end


    if @word["found"] == true
      @answer = "You won #{@word["length"]} points!! '#{params[:word]}' exists :) "
    else
      @answer = "You lost"
    end
  end
end
