# encoding: utf-8
# エラトステネスの篩
# ある数が素数か判別する際、その数の平方根以上、半分以下の整数で割り切れなければ素数である

require 'benchmark'
require 'pry'
Upper_limit = 1000000

class Prime
  def initialize(upper_limit)
    @upper_limit = upper_limit
    @search_list = [*(2..upper_limit)]
    @prime_list  = []
  end

  def sieve_of_eratosthenes
    return @prime_list = []  if @upper_limit < 2
    return @prime_list = [2] if @upper_limit == 2

    limit = (@upper_limit ** 0.5).to_i
    array = (1 .. @upper_limit).step(2).to_a
    array[0] = 2
    length = array.size

    i = 0
    while true
      i = i + 1
      j = array[i]
      next unless j
      break if j > limit
      k = 2 * i * (i + 1)
      while k < length
        array[k] = nil
        k = k + j
      end
    end

    @prime_list =  array.compact!
  end

  def print
    puts "最大の素数は: #{@prime_list.last}"
    puts "素数の総数は: #{@prime_list.count}"
  end
end

puts Benchmark::CAPTION

speed = Benchmark.measure{
  prime = Prime.new(Upper_limit)
  prime.sieve_of_eratosthenes
  prime.print
}
puts speed

if speed.real < 10
  puts '...success！'
else
  puts "...too bad!"
end
