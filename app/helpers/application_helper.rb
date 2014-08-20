module ApplicationHelper

	def inline_svg(path)
	    File.open("app/assets/images/#{path}") do |file|
	    raw file.read
	  end
	end
end
