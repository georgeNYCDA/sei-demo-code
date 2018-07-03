class TodoComment < ApplicationRecord
	include DateLabel
  
  	belongs_to :todo

end
