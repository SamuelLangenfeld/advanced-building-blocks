def bubble_sort(num_array)

	(num_array.size-1).times do
		num_array.each_index do |indx|
			if !(num_array[indx+1].nil?)

				if (num_array[indx]>num_array[indx+1])
					
					x=num_array[indx+1]
					num_array[indx+1]=num_array[indx]
					num_array[indx]=x
				end
			end
		end
	end

	num_array
end

bubble_sort([4,3,78,2,0,2])




def bubble_sort_by(num_array)
	(num_array.size-1).times do
		num_array.each_index do |indx|
			if !(num_array[indx+1].nil?)
				left= num_array[indx]
				right=num_array[indx+1]
				if (yield(left, right)>0)
					x=num_array[indx+1]
					num_array[indx+1]=num_array[indx]
					num_array[indx]=x
				end
			end
		end
	end

	num_array

end

bubble_sort_by(["hi", "bi", "hello", "hey", "howdy"]) do |left, right|
	left.length-right.length
end

