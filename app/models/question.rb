class Question < ApplicationRecord
  belongs_to :subject

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :questions, partial: "questions/index", locals: { question: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :questions, target: dom_id(self, :index) }
end
