# frozen_string_literal: true
class Cabinet::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'cabinet'
end
