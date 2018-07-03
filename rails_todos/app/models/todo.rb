class Todo < ApplicationRecord

	before_validation :log_bv
	before_save :log_bs
	before_create :log_bc

	include DateLabel

	validates :name, :description, :priority, presence: true
	validates :name, length: { minimum: 4 }
	validates :priority, inclusion: { in: ['H', 'M', 'L'], message: "Please select a valid priority" }


	has_many :todo_comments, dependent: :destroy

	scope :created_after, ->(my_time) { where("created_at >= ?", my_time) }
	scope :high_priority, -> { where(priority: 'H') }


	def self.all_todo_names
		Todo.all.pluck(:name).join(' ')
	end

	private
	def log_bv
		print 'this is beeing called before valiation'
	end

	def log_bs
		print 'this is beeing called before save'
	end

	def log_bc
		print 'this is beeing called before create'
	end

end
