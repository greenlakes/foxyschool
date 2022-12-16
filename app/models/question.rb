# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  answer     :string
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :bigint           not null
#
# Indexes
#
#  index_questions_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
class Question < ApplicationRecord
  belongs_to :subject

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :questions, partial: "questions/index", locals: { question: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :questions, target: dom_id(self, :index) }
end
