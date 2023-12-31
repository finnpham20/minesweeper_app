# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @boards = Board.order(created_at: :desc).limit(10)
  end
end
