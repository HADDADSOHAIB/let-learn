class HomeController < ApplicationController
  def index
    @thoughts = Thought.all
    @thought = Thought.new
  end
end
