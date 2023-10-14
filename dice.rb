require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)    
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  @header = "2d6"
  erb(:dice_roll_outcome)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  @header = "2d10"
  erb(:dice_roll_outcome)
end

get("/dice/1/20") do
  @die = rand(1..20)
  @outcome = "You rolled a #{@die}"
  @header = "1d20"
  erb(:dice_roll_outcome)
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  @outcome = "You rolled a  #{first_die} and a #{second_die} and a #{third_die} and a #{fourth_die} and a #{fifth_die} for a total of #{sum}"
  @header = "5d4"
  erb(:dice_roll_outcome)
end

get("/dice/100/6") do
  @rolls = []
  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end
  sum = @rolls.sum
  @header = "100d6"
  @outcome = "You rolled the below values for a total of #{sum}"
  erb(:dice_roll_outcome)
end
