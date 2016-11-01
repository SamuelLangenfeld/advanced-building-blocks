module Enumerable


	def my_each
		return enum_for(:my_each) unless block_given?

		if self.instance_of? Array
			i=0
			while i<self.length
				yield(self[i])
				i+=1
			end
		end

		if self.instance_of? Hash
			my_array=self.to_a
			i=0
			while i<my_array.length

				yield(my_array[i][0],my_array[i][1])
				i+=1
			end
		end
	end

	def my_each_with_index
		return enum_for(:my_each_with_index) unless block_given?
		if self.instance_of? Array
			i=0
			while i<self.length
				yield(self[i], i)
				i+=1
			end
		else
			return false
		end
	end


	def my_select
		return enum_for(:my_select) unless block_given?
		if self.instance_of? Array
			new_array=[]
			i=0
			while i<self.length
				if yield(self[i])
					
					new_array.push(self[i])
				end
				i+=1
			end
			return new_array
		
		elsif self.instance_of? Hash
			
			new_hash=[]
			new_array=self.to_a
			i=0
			while i<new_array.length
				
				if yield(new_array[i][0], new_array[i][1])
					new_hash.push([new_array[i][0],new_array[i][1]])
				end
				i+=1
			end
			return new_hash
		else
			return false
		end

	end
	

	


	def my_all
		return enum_for(:my_all) unless block_given?
		test=true
		self.my_each do |i|
			if !(yield(i))
				test=false
				return test
			end
		end
	end

	def my_any?
		return enum_for(:my_any) unless block_given?
		test=false
		self.my_each do |i|
			if yield(i)
				test=true
				return test
			end
		end
	end

	def my_none?
		return enum_for(:my_none) unless block_given?
		
		self.my_any? do |i|
			if yield(i)
				return false
			end
		end
		return true
	end


	def my_count(obj=nil)
		

		if obj==nil
			
			if block_given?
	
				new_array=self.my_select do |i|
					yield(i)
				end
				
				return new_array.size
			
			else
				return self.size
				
			
			end
			
		else
			
			if self.instance_of? Hash
				
				new_array=self.my_select do |k,v|
					new_hash={}
					new_hash.store(k,v)
					new_hash==obj
					
				end
				return new_array.size
			
			elsif self.instance_of? Array
			
				new_array=self.my_select do |i|

					i==obj
					
					
				end
				return new_array.size
			end
		
		end
	end
	

	




	def my_map(the_proc=nil)
		
		if the_proc==nil
			return enum_for(:my_map) unless block_given?

			if self.instance_of? Array 
				new_array=[]
				self.my_each do |i|
					new_array.push(yield(i))
				end
				return new_array
				
			elsif self.instance_of? Hash 
				new_array=[]
				
				self.my_each do |k,v|
					new_array.push(yield(k,v))
				end
				
				return new_array
			
			end
	
			return false
		else
			
			if self.instance_of? Array 
				new_array=[]
				self.my_each do |i|
					new_array.push(the_proc.call(i))
				end
				return new_array
				
			elsif self.instance_of? Hash 
				new_array=[]
				
				self.my_each do |k,v|
					new_array.push(the_proc.call(k,v))
				end
				
				return new_array				
				
			end
		end
	

	end


	
	
	
	
	def my_inject(initial=nil)
		return enum_for(:my_inject) unless block_given?
		total=initial
		self.my_each do |i|
			if total
				total=yield(total, i)
			else
				total=self.first
			end
		end
		return total


	end






end

	def multiply_els(array)
		result=array.my_inject {|total, n| total*n}
		return result
	end
	


