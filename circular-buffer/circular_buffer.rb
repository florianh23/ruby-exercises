# frozen_string_literal: true

# Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
# `circular_buffer_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/circular-buffer` directory.

class CircularBuffer
  # first in first out

  class BufferFullException < StandardError
  end

  class BufferEmptyException < StandardError
  end

  attr_accessor :size, :buffer, :front, :end, :count

  def initialize(size)
    @size = size
    @buffer = Array.new(size)
    @front = @end = @count = 0
    @nil_count = 0
  end

  def write(value)
    raise BufferFullException if full?

    @buffer[@front] = value
    move_front
  end

  def write!(value)
    read if full?

    write(value)
  end

  def read
    raise BufferEmptyException if empty?

    @buffer[@end].tap { move_end }
  end

  def empty?
    @count.zero?
  end

  def full?
    @count == @size
  end

  def move_front
    @front = (@front + 1) % @size
    @count += 1
  end

  def clear
    @front = @end = @count = 0
  end

  def move_end
    @end = (@end + 1) % @size
    @count -= 1
  end
end
