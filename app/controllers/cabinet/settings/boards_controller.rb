# frozen_string_literal: true
class Cabinet::Settings::BoardsController < Cabinet::ApplicationController
  def index
    @boards = current_client.find(:members, current_account.uid).boards
  end

  def create; end
end
