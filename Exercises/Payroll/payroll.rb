require 'awesome_print'

class InformationGetter
	def read_from_file
		@employee_info = IO.read("employees.txt").split("\n")
		@employee_info.map do |item|
			item.split(" -> ").to_a
		end
		ap @employee_info
	end
end


InformationGetter.new.read_from_file