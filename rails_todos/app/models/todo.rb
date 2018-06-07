class Todo < ApplicationRecord
	has_many :todo_comments, dependent: :destroy
end
