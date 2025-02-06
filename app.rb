require "sinatra"
require "sinatra/reloader"

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
  @apr_user = (params.fetch("user_apr", "0").to_f / 100).to_fs(:percentage)
  @apr = params.fetch("user_apr").to_f / 100 / 12
  @user_years_user = params.fetch("user_years").to_i
  @user_years = params.fetch("user_years").to_i * 12
  @user_pv= params.fetch("user_pv").to_f.to_fs(:currency)
  @the_numerator = @apr * @user_pv
  @the_dem = 1 - (1+@apr)**(-@user_years)
  @result = @the_numerator/@the_dem
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
