#!/usr/bin/ruby

require './calculator'
require './tty'

principal = 150.0
contribution = 100.0
annual_rate = 0.08
compounds_per_year = 12
step = 100.0
step_until = 1000.0

#TODO: create a Dollar class that extends float and its to_s does this
# all floats are dollars, but they are effectively just floats
def dollar amt
    #TOOD: need commas in the right places
    sprintf "$%0.02f", amt
end

for i in 0..40
    puts "#{Tty.yellow}Year #{i}#{Tty.reset}"

    contribution += step if contribution < step_until
    puts "#{Tty.cyan}Contribution#{Tty.reset} #{dollar(contribution)}"

    compound_interest = Calculator.compound_interest_for_principal(principal, annual_rate, compounds_per_year, 1)
    puts "#{Tty.red}Interest#{Tty.reset} #{dollar(compound_interest)}"

    future_value = Calculator.future_value_of_series(contribution, annual_rate, compounds_per_year, 1)
    puts "#{Tty.gray}Future Value#{Tty.reset} #{dollar(future_value)}"

    balance = compound_interest + future_value
    puts "#{Tty.green}Balance#{Tty.reset} #{dollar(balance)}"

    principal = balance
    
    puts
end
