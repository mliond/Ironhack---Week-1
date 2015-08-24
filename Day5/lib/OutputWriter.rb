class OutputWriter
	def write_output(result)
		if result == true
			puts "yay"
			# IO.write("output.txt", "LEGAL")
		else
			puts "nay"
			# IO.write("output.txt", "ILLEGAL")
		end
	end
end
