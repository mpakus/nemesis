# frozen_string_literal: true
class Account < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
end
