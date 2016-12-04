class Score < ApplicationRecord
  belongs_to :report

  has_secure_token :code

  def to_param
    code
  end
end

# == Schema Information
#
# Table name: scores
#
#  code       :string(24)
#  content    :text(65535)
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  report_id  :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_scores_on_code       (code)
#  index_scores_on_report_id  (report_id)
#
# Foreign Keys
#
#  fk_rails_68381603aa  (report_id => reports.id)
#
