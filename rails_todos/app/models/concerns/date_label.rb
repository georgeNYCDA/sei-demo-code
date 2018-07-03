module DateLabel

	def created_at_label
		created_at.strftime('%b %d, %Y')
	end

	def updated_at_label
		updated_at.strftime('%b %d, %Y')
	end

end