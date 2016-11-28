# frozen_string_literal: true
class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts
  delegate :token, to: :accounts, prefix: true, allow_nil: true
end
