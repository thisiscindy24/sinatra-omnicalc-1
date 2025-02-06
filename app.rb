require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get ("/howdy") do
  "hello"
  erb (:hello)
end

get("/") do
  erb(:new_square_cal)
  
end

get ("/square/new") do  
  erb(:new_square_cal)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get ("/square_root/new") do
  erb(:square_root_new)
end

get ("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end

get ("/payment/new") do
  erb(:payment_new)
end

get ("/payment/results") do
  apr = params.fetch("user_apr").to_f
  years = params.fetch("user_years").to_i
  principle= params.fetch("user_pv").to_f

  r = (apr/100)/12
  n = years*12

  if r==0
    payment=principle.to_f
  else
    payment = (r*principle) / (1-(1+r)**-n)
  end

  @formatted_apr = apr.to_fs(:percentage, { :precision => 4 } )
  @formatted_years = years
  @formatted_principle = principle.to_fs(:currency, { :precision => 2 })
  @formatted_payment = payment.to_fs(:currency, { :precision => 2 })
  erb(:payment_results)
end

get ("/random/new") do
  erb(:random_new)
end

get ("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  if @min < @max
    @result = rand(@min..@max)
  else
    @result = ""
  end
  erb(:random_results)
end
