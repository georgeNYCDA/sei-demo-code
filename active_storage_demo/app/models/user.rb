class User < ApplicationRecord
	has_one_attached :user_profile
	
end
