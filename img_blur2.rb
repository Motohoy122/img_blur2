class Image
  def initialize(matrix)
    @matrix = matrix
  end

  def output_image
    one_loc = []

    @matrix.each_with_index do |row, r_index|
      row.each_with_index do |column, c_index|
        # if the value at this index is 1
        if column == 1
          xy_loc = [r_index, c_index]
          one_loc.push(xy_loc)
        end
      end 
    end

    one_loc.each do |sub_array|
      # Changes value above th one index
      if sub_array[0] > 0
        @matrix[sub_array[0] - 1][sub_array[1]] = 1
      end
      # Changes value below the one index
      if sub_array[0] < 3
        @matrix[sub_array[0] + 1][sub_array[1]] = 1
      end
      # Changes value left of the one index
      if sub_array[1] > 0
        @matrix[sub_array[0]][sub_array[1] - 1] = 1
      end
      # Changes value right of the one index
      if sub_array[1] < 3
        @matrix[sub_array[0]][sub_array[1] + 1] = 1
      end
    end
    @matrix.each do |row|
      puts row.join('')
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

# Iterate through the main array - line 7
# Iterate through sub arrays => row on line 8
# If the value = 1, then its time to mutate
# What should I mutate? 
# Top, Right, Left, Bottom
# Is the top mutatable? => If the row index is not 0, then the top is mutatable
# If the top is mutatable => row_index - 1

