# encoding: utf-8
# 素数問題

require 'pry'
Upper_limit = 100

class Prime
  def initialize(upper_limit)
    @upper_limit = upper_limit
    @result      = []
  end

  def prime
    (1..@upper_limit).each do |target|
      next if target == 1
      comp(target)
    end
  end

  def comp(target)
    count = 0
    (1..target).each do |num|
      count += 1 if target % num == 0
    end
    @result << target if count == 2
  end

  def print
    puts @result
  end
end

prime = Prime.new(Upper_limit)
prime.prime
prime.print
