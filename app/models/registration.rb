class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  
  HOW_HEARD_OPTIONS = ['Newsletter', 'Blog Post', 'Twitter', 'web search', 'Friend/Coworker', 'other']
  validates :how_heard, inclusion: {in: HOW_HEARD_OPTIONS}
end
