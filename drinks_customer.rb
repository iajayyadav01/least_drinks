def least_drink(drink_list, m, cust)

	array = Array.new(m){Array.new(cust + 1, 0)}

	array.each_with_index do |user, i|
		user.each_with_index do |choice, j|
			next unless drink_list[i] && drink_list[i][j]
			index = drink_list[i][j]
			array[index][i] = 1
		end
	end

    for i in 0..(m-1)
        sum = 0
        for j in 0..(cust-1)
            sum += arr[i][j]
        end
        arr[i][cust] = sum;
    end


	cust_left = cust 
	count = 0 
	while cust_left > 0
		index_remaining = 0
		max_rep = 0
		array.each_with_index do |row, i|
			if array[i][cust] > max_rep
				max_rep = array[i][cust]
				index_remaining = i
			end
		end
			count += 1 
			cust_left -= max_rep
			# for to eliminate the counted drink with its cust
			for i in 0..cust
				if array[index_remaining][i] == 1
					array.each_with_index do |row, j|
						if array[j][i] == 1
							array[j][i] = 0
							array[j][cust] -= 1
						end
					end
				end
			end
		end
	return count
end