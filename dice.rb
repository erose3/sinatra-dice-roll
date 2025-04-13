require "sinatra"
require "sinatra/reloader"

line = "="*20

get("/") do
  "<h1>DICE ROLL</h1>
  <h3><a href = '/dice/2/6'> Roll two 6-sided dice</a></h3>
  <h3>Roll two 10-sided dice</h3>
  <h3>Roll one 20-sided dice</h3>
  <h3>Roll five 4-sided dice</h3>"

end

get ("/dice/2/6") do
  first_die = rand(1...6)
  second_die = rand(1...6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1> 2d6</h1>
  <p>#{outcome}</p>
  <p></p>
  <p><a href = '/' > Return Home 🏠 </a></p>"

end

get ("/dice/2/10") do
  first_die = rand(1...10)
  second_die = rand(1...10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1> 2d6 </h1>
  <p> #{outcome} </p>"
end
