require 'sinatra'
require 'json'
require 'faker'

DATABASE = Array.new(1000) { { name: Faker::Name.name, age: rand(15..90) } }

get '/' do
  erb(:index)
end

get '/users.json' do
  if params[:age]
    user_data = DATABASE.select do |record|
      record[:age] >= params[:age].to_i
    end
  else
    user_data = DATABASE
  end

  JSON.dump(user_data)
end
