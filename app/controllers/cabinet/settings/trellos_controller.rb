# frozen_string_literal: true
class Cabinet::Settings::TrellosController < Cabinet::ApplicationController
  # skip_before_action :authenticate, only: [:create]

  def create
    current_user.find_or_create_from_omniauth(auth)
    redirect_to cabinet_settings_boards_path, notice: 'Trello connected'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
