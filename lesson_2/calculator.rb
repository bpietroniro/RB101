# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  # first LS suggested solution: input.to_i.to_s() == input
  # my idea since I don't know regex:  use ASCII numbers.
  # if the string doesn't contain any
  # characters outside of ASCII 48-57,
  # it's not a valid integer.
  num.chars.each do |c|
    if c.ord < 48 ||  c.ord > 57
      return false
    end
  end
  true
end

def float?(num)
  # make sure there's no more than one floating point
  if num.chars.count('.') > 1
    return false
  end
  
  # make sure all chars are numerals or floating point
  num.chars.each do |c|
    if c.ord < 46 || c.ord == 47 || c.ord > 57
      return false
    end
  end
  true
end

def operation_to_message(op)
  result = case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
    end
  result
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")
loop do
  number1 = ''

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator = ''
  operator_prompt = <<-MSG
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("You must choose 1, 2, 3, or 4.")
    end
  end

  prompt("#{operation_to_message(operator)}")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}.")

  prompt(MESSAGE['again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGE['goodbye'])
