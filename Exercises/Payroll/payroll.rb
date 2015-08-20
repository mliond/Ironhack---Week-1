class InformationGetter
	def read_from_file
		@employee_info = IO.read("employees.txt")
	end

	def reformat_data
		@employee_info.split()