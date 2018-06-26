class Todo < ApplicationRecord
	validates :name, :description, :priority, presence: true
	validates :name, length: { minimum: 4 }
	validates :priority, inclusion: { in: ['H', 'M', 'L'], message: "Please select a valid priority" }


	has_many :todo_comments, dependent: :destroy

	scope :created_after, ->(my_time) { where("created_at >= ?", my_time) }
	scope :high_priority, -> { where(priority: 'H') }
end
