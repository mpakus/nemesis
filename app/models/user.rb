# frozen_string_literal: true
class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts
  delegate :token, to: :accounts, prefix: true, allow_nil: true

  def find_or_create_from_omniauth(auth)
    accounts.find_or_create_by(uid: auth['uid']).tap do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.trello_username = auth['info']['nickname']
      u.token = auth['credentials']['token']
      u.secret = auth['credentials']['secret']
      u.save
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  unlock_token           :string(255)
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
