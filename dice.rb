require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

line = "="*20

get("/") do
  "<h1>DICE ROLL</h1>
  <ul>
  <li><a href = '/dice/2/6'> Roll two 6-sided dice</a></li>
  <li><a href = '/dice/2/10'>Roll two 10-sided dice</a></li>
  <li><a href = '/dice/1/20'>Roll one 20-sided dice</a></li>
  <li><a href = '/dice/5/4'>Roll five 4-sided dice</a></li>
  </ul>"

end

get ("/dice/2/6") do
  first_die = rand(1...6)
  second_die = rand(1...6)
  sum = first_die + second_die

  "<h1>Rolling two 6-sided dice</h1>
  You rolled:
  <ul>
  <li> #{first_die} </li>
  <li>#{second_die}</li>
  </ul>
  <p> For a total of #{sum}.</p>
  <p></p>
  <p><a href = '/' > Return Home 🏠 </a></p>"

end

get ("/dice/2/10") do
  first_die = rand(1...10)
  second_die = rand(1...10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1> Rolling two 10-sided dice </h1>
  You rolled:
  <ul>
  <li> #{first_die} </li>
  <li>#{second_die}</li>
  </ul>
  <p> For a total of #{sum}.</p>
  <p></p>
  <p><a href = '/' > Return Home 🏠 </a></p>"
end

get ("/dice/1/20") do
  first_die = rand(1...20)
  outcome = "You rolled a #{first_die}."

  "<h1> Rolling one 20-sided dice </h1>
  <p>#{outcome}</p>
  <p></p>
  <p><a href = '/' > Return Home 🏠 </a></p>"
end

get ("/dice/5/4") do
  first_die = rand(1...4)
  second_die = rand(1...4)
  third_die = rand(1...4)
  fourth_die = rand(1...4)
  fifth_die = rand (1...4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die
  outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die}; for a total of #{sum}."

  "<h1> Rolling five 4-sided dice </h1>
  You rolled:
  <ul>
  <li> #{first_die} </li>
  <li>#{second_die}</li>
  <li>#{third_die}</li>
  <li>#{fourth_die}</li>
  <li>#{fifth_die}</li>
  </ul>
  <p> For a total of #{sum}.</p>
  <p></p>
  <p><a href = '/' > Return Home 🏠 </a></p>"
end
