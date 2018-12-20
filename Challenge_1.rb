# encoding: utf-8
# FizzBuzz問題

require 'pry'
Upper_limit = 100

class FizzBuzz
  def initialize(upper_limit)
    @upper_limit = upper_limit
    @result      = []
  end

  def fizzbuzz
    (1..@upper_limit).each do |target|
      case
      when target % 15 == 0
        @result << 'FizzBuzz'
      when target % 3  == 0
        @result << 'Fizz'
      when target % 5  == 0
        @result << 'Buzz'
      else
        @result << target
      end
    end
  end

  def print
    puts @result
  end
end

fizzbuzz = FizzBuzz.new(Upper_limit)
fizzbuzz.fizzbuzz
fizzbuzz.print
