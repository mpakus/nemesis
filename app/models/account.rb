# frozen_string_literal: true
class Account < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
end

# == Schema Information
#
# Table name: accounts
#
#  created_at      :datetime         not null
#  email           :string(255)
#  id              :integer          not null, primary key
#  name            :string(255)
#  secret          :string(255)
#  token           :string(255)
#  trello_username :string(255)
#  uid             :string(64)
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_accounts_on_uid      (uid)
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_b1e30bebc8  (user_id => users.id)
#
