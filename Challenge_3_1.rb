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
    @sqrt = Math.sqrt(upper_limit).floor
    @prime_list  = []
  end

  def sieve_of_eratosthenes
    while first_num = @search_list.shift
      @prime_list << first_num
      break if first_num >= @sqrt
      @search_list.delete_if{ |num| num % first_num == 0 }
    end
    @prime_list.concat(@search_list)
  end

  def print
    puts "最大の素数は: #{@prime_list.last}"
    puts "素数の総数は: #{@prime_list.count}"
  end
end

# ラベル行の表示
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
