require 'enumerable-methods'



describe Enumerable do

	let(:my_array) do
		[5,4,3,2]
	end

	let(:my_hash) do
		{:dog=>"german shepherd", :cat=>"black", :pet=>"german shepherd"}
	end

	let(:array_result) do
		[]
	end

	let(:hash_result) do
		{}
	end


	describe "my_each" do
		context "Given an array and block that manipulates array" do
			it "executes block for each element" do
				my_array.my_each {|i| array_result.push(i)}
				expect(array_result).to eql([5,4,3,2])
			end
		end
		
		context "Given a hash and block that manipulates array" do
			it "executes block for each element" do
				my_hash.my_each {|k,v| hash_result.store(k,v)}
				expect(hash_result).to eql({:dog=>"german shepherd", :cat=>"black", :pet=>"german shepherd"})
			end
		end

		context "If no block inputed" do
			it "Returns Enumerator" do
				expect(my_array.my_each).to be_an_instance_of(Enumerator)
			end
		end
	end

	describe "my_select" do
		context "Given an array" do
			it "returns an array" do
				expect(my_array.my_select {|i| i>2}).to be_an_instance_of(Array)
			end
			it "returns the values that fit the parameters" do
				expect(my_array.my_select {|i| i>2}).to eql([5,4,3])
			end
		end
		context "Given a hash" do
			it "returns a hash" do
				expect(my_hash.my_select {|k,v| v=="black"}).to be_an_instance_of(Hash)
			end
			it "returns a hash with the keys and values that fit the block" do
				expect(my_hash.my_select {|k,v| v=="german shepherd"}).to eql({:dog=>"german shepherd", :pet=>"german shepherd"})
			end
		end

		context "if no block given" do
			it "returns Enumerator" do
				expect(my_array.my_select).to be_an_instance_of(Enumerator)
			end
		end

	end

	describe "my_any?" do
		context "if no block given" do
			it "returns Enumerator" do
				expect(my_array.my_any?).to be_an_instance_of(Enumerator)
			end
		end

		context "if array is given" do
			it "returns true if a value fits the parameters" do
				expect(my_array.my_any? {|i| i>2}).to eql(true)
			end
			it "returns false if no value fits the parameters" do
				expect(my_array.my_any? {|i| i>100}).to eql(false)
			end
		end

		context "if a hash is given" do
			it "returns true if a value fits the parameters" do
				expect(my_hash.my_any? {|k,v| v>"feather"}).to eql(true)
			end
			it "returns false if no value fits the parameters" do
				expect(my_hash.my_any? {|k,v| v>"zebra"}).to eql(false)
			end
		end


	end

	describe "my_all?" do
		context "if all elements passed to block return true" do
			it "returns true" do
				expect(my_array.my_all? {|i| i>1}).to eql(true)
			end
		end

		context "if an element passed to block returns false" do
			it "returns false" do
				expect(my_array.my_all? {|i| i>2}).to eql(false)
			end
		end

		context "if all values of hash passed to block return true" do
			it "returns true" do
				expect(my_hash.my_all? {|k,v| v>"Aardvark"}).to eql(true)
			end
		end
	end


	describe ".my_any?" do

		context "if any element of array returns true from block" do
			it "returns true" do
				expect(my_array.my_any? {|i| i==3}).to eql(true)
			end
		end

		context "if no elements of the array return true from block" do
			it "returns false" do
				expect(my_array.my_any? {|i| i<2}).to eql(false)
			end
		end

		context "if a key/value pair from hash returns true from block" do
			it "returns true" do
				expect(my_hash.my_any? {|k,v| k==:pet}).to eql(true)
			end
		end

		context "if no key/value pair from hash returns true from block" do
			it "returns false" do
				expect(my_hash.my_any? {|k,v| k==:monster}).to eql(false)
			end
		end
	end


	describe "my_none?" do

		context "if all of the elements of array return false from block" do
			it "returns true" do
				expect(my_array.my_none? {|i| i>5}).to eql(true)
			end
		end

		context "if one of the elements of array return true from block" do
			it "returns false" do
				expect(my_array.my_none? {|i| i>4}).to eql(false)
			end
		end

		context "if all of the key/value pairs from hash return false from block" do
			it "returns true" do
				expect(my_hash.my_none? {|k,v| v=="husky"}).to eql(true)
			end
		end

		context "if one of the key/value pairs from hash return true from block" do
			it "returns false" do
				expect(my_hash.my_none? {|k,v| k==:pet}).to eql(false)
			end
		end
	end

	



	
end