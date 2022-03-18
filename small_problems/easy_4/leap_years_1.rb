=begin

PROBLEM
In the modern era under the Gregorian Calendar, leap years occur in every
year that is evenly divisble by 4, unless the year is also divisible by 100.
If the year is evenly divisible by 100, then it is not a leap year unless the
year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method
that takes any year greater than 0 as input, and returns true if the year is
a leap year, or false if it is not a leap year.

input: integer
output: boolean

(see examples below)

ALGORITHM
- check whether the year is divisible by 4
  - if so, check whether divisible by 100
    - if so,  check whether divisible by 400
      - if not, return false
    - if not, return true
  - if not, return false

=end

def divisible?(num, divisor)
  num % divisor == 0
end

def leap_year?(year)
  if divisible?(year, 4)
    if divisible?(year, 100)
      divisible?(year, 400) ? true : false
    else
      true
    end
  else
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
