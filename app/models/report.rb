class Report < ApplicationRecord
  belongs_to :account
  has_many :items
  accepts_nested_attributes_for :items
  validates :name, presence: true, on: :update
end

# == Schema Information
#
# Table name: reports
#
#  created_at :datetime         not null
#  deleted_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reports_on_deleted_at  (deleted_at)
#
