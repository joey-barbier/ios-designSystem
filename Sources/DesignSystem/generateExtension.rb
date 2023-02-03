#!/usr/bin/env ruby

class Log
    def self.logStartMethod(str)
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts str
    end
    
    def self.logInMethod(str)
        puts " - " + str
    end
    
    def self.logEndMethod()
        puts "<<<<<<<<<<<<<\n\n"
    end
end 

class GenerateExtend
	def initialize(pathColor, pathUIColorFile, classImport, classExtend, classInit, classEnumName)
		@pathColor = pathColor
		@pathUIColorFile = pathUIColorFile
        @classImport = classImport
        @classExtend = classExtend
        @classInit = classInit

		@file = nil
        @tabulationIndex = 1
        @result = {}
        
        @resultStr = "import " + classImport
        @resultStr << "\n\n"
        @resultStr << "extension " + classExtend + " {"
        
        newLine("enum " + classEnumName + " {")
        @tabulationIndex += 1
    end

    def run()
        Log.logStartMethod("Start: run ⏳")
        Log.logEndMethod()
    	
        Log.logStartMethod("Start: create file 📄")
    	createFile()
        Log.logEndMethod()

        Log.logStartMethod("Start: Generate data 💭")
    	generateData()
        Log.logEndMethod()

        Log.logStartMethod("Start: Data to string ✍️")
    	dataToString()
        Log.logEndMethod()
    end

	def createFile()
		#remove if already exist
        Log.logInMethod("Remove file")
		File.delete(@pathUIColorFile) if File.exist?(@pathUIColorFile)

		#create file
		@file = File.open(@pathUIColorFile, "w")
        Log.logInMethod("Create file: " + @pathUIColorFile)
	end

	def generateData()
		# Generate a array with all colors & merge same key
		Dir.new(@pathColor).each do |file|
			colorName = file.clone.split(/(\.)/, 2).first
			colorData = colorName.split("_")
			
			temp = @result

			colorData.each do |el|
				#create a key if not already exist in array
				if !temp.has_key?(el)
					temp[el] = {}
				end
				
				if el == colorData.last
					temp[el] = colorName
				else
					temp = temp[el]
				end
			end
		end
	end

	def dataToString()
		valueToText(@result)
		#close custom enum
		@tabulationIndex -= 1
		newLine("}")
		#close UIColor exetension
		@tabulationIndex -= 1
		newLine("}")
		@file.puts @resultStr
        Log.logInMethod("Success ! ⚡️")
	end

    #Method called for write a new line in file
	def newLine(appendValue)
		@resultStr << "\n"
		for i in 1..@tabulationIndex do
		   @resultStr << "\t"
		end
		@resultStr << appendValue
	end

	def valueToText(currentHash)
		currentHash.each do |key, value|
			if value.is_a? String
                # If the value is a String, we add a new variable
                valueStr = @classInit.clone
                valueStr.gsub! '{value}', value
                newLine("static var " + key + " = " + valueStr)
			else
                # If the value is a Hash, we add a new Enum
				newLine("enum " + key.capitalize() + " {")
				@tabulationIndex += 1
				valueToText(value) #continue in hash
				# close enum
				@tabulationIndex -= 1
				newLine("}")
			end
		end
	end
end
