class Image
  attr_accessor :image

  def initialize(array)
    @img = array
  end

  def get_pixels_with_ones
    pixels_with_ones = []
    @img.each_with_index do |img_row, y|
      img_row.each_with_index do |cell, x|
        if cell == 1
          pixels_with_ones << [y, x]
        end
      end
    end
    pixels_with_ones
  end

  def blur(pixels)
    pixels.times do
      pixels_with_ones = get_pixels_with_ones
      @img.each_with_index do |img_row, y|
        img_row.each_with_index do |cell, x|
          if pixels_with_ones.include?([y, x])
            @img[y-1][x] = 1 unless y == 0
            @img[y+1][x] = 1 unless y == (@img.length - 1)
            @img[y][x-1] = 1 unless x == 0
            @img[y][x+1] = 1 unless x == (img_row.length - 1)
          end
        end
      end
    end
  end

  def output_image
    @img.each do |img_row|
      img_row.each do |img_col|
      print img_col
    end
      puts 
    end
  end

end

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
])

pixels = 1
puts "Test image: 1 in each corner, 1 at the side midpoints & 1 in the center"
image.output_image
puts
puts
puts
puts "Manhattan Blur Distance: " + pixels.to_s
image.blur(pixels)
image.output_image