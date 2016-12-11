class Item < ApplicationRecord
  after_save :transform_lists
  belongs_to :generator
  delegate :name, to: :generator, prefix: true, allow_nil: true
  belongs_to :report

  private

  def transform_lists
    return if lists.blank?
  end
end

# == Schema Information
#
# Table name: items
#
#  boards       :text(65535)
#  created_at   :datetime         not null
#  deleted_at   :datetime
#  generator_id :integer
#  id           :integer          not null, primary key
#  lists        :text(65535)
#  report_id    :integer
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_items_on_deleted_at    (deleted_at)
#  index_items_on_generator_id  (generator_id)
#  index_items_on_report_id     (report_id)
#
# Foreign Keys
#
#  fk_rails_227c6a057c  (generator_id => generators.id)
#  fk_rails_422953d7a1  (report_id => reports.id)
#
