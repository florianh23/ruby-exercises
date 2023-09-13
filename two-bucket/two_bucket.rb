# Write your code for the 'Two Bucket' exercise in this file. Make the tests in
# `two_bucket_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/two-bucket` directory.
require 'pry'
require 'pry-nav'

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_one, bucket_two, _desired_liters, _start_bucket)
    @buckets = []
    one = Bucket.new(bucket_one, 'one')
    two = Bucket.new(bucket_two, 'two')
    @buckets << one
    @buckets << two
    @other_bucket = @buckets.find { |bucket| bucket.name != _start_bucket }
    @start = @buckets.find { |bucket| bucket.name == _start_bucket }

    p 'other'
    p @other_bucket
    p '@start'
    p @start
    p 'buckets'
    p @buckets

    bucket_array = @buckets.first.name == _start_bucket ? @buckets : @buckets.reverse

    @desired_liters = _desired_liters
    @moves = 0
    goal_bucket, other_bucket = solve
    @goal_bucket = goal_bucket.name
    @other_bucket = other_bucket.level
  end

  private

  def solve
    until @buckets.map(&:level).any? { |g| g == @desired_liters }
      @moves += 1
      binding.pry
      p @moves
      p @buckets.map(&:level)
      if @start.level.zero?
        @start.fill
      elsif @other_bucket.capacity == @desired_liters
        @other_bucket.fill
      elsif @other_bucket.capacity > @other_bucket.level
        @start.transfer(@other_bucket)
      elsif @other_bucket.full?
        @other_bucket.pour
      end
    end
    result
  end

  def result
    @buckets.partition { |b| b.level == @desired_liters }.map(&:first)
  end

  class Bucket
    # attr_reader :capacity, :name
    attr_accessor :level, :capacity, :name

    def initialize(capacity, name)
      @capacity = capacity
      @name = name
      @level = 0
    end

    def fill
      @level = capacity
    end

    def pour
      @level = 0
    end

    def full?
      @level == @capacity
    end

    def transfer(bucket)
      free_space_p = bucket.capacity - bucket.level
      if @level <= free_space_p
        bucket.level += @level
        free_space_a = bucket.capacity - bucket.level
        @level -= (free_space_p - free_space_a)
      else
        @level -= free_space_p
        bucket.fill
      end
    end
  end
end
