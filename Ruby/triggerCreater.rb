$CODE = 'u'

def readfile(fileName)

	if false == File::exist?(fileName)
		puts "The file #{fileName} is not exist!"
		puts "Please check it!"
	else
		count = 0

		if !ARGV[1] 
			puts "Please enter a file name to save the info."
		else
			oldFile = File.new("old.txt", "wb")

			for i in IO.readlines(fileName)
				if i =~ %r|name|
 					result  = i.sub(%r|',.*,|,"")
					result2 = result.sub(%r|.*name.*:.*'|,"").chomp

					rst = %{#define TRIGGER_#{result2.upcase} "#{result2}" \n}
					
					# Save the data to the file
					oldFile.syswrite(%{#{rst}})					
				end
			end
			
			old = File.open("old.txt","r+")
			newFile = File.new(ARGV[1], "wb")

			for i in File.readlines("old.txt").uniq
				count += 1
				newFile.write(i)
			end
			
			File::delete("old.txt")

			puts "!!!DONE!!! #{count} lines"
			puts "The result is in #{ARGV[1]}"
		end
	end
end

def inputFileName
	puts "Please enter file name:"
	val = gets
	puts val
	readfile(val)
end

if 0 != ARGV.length
	readfile(ARGV[0])
else
	#inputFileName
	puts "Please enter file name."
end
