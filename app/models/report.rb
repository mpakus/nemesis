class Report < ApplicationRecord
  belongs_to :account
  has_many :items, dependent: :destroy
  has_many :scores, dependent: :destroy

  accepts_nested_attributes_for :items

  validates :name, presence: true, on: :update
end

# == Schema Information
#
# Table name: reports
#
#  account_id :integer
#  created_at :datetime         not null
#  deleted_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reports_on_account_id  (account_id)
#  index_reports_on_deleted_at  (deleted_at)
#
# Foreign Keys
#
#  fk_rails_126d07513e  (account_id => accounts.id)
#
