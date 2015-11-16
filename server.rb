require "sinatra"
require 'json'
require 'pry'
set :views_folder, File.join(File.dirname(__FILE__), "views")

league = File.read('roster.json')
data_hash = JSON.parse(league)

get "/teams" do
  @teams = data_hash.keys
  erb :index
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @team_data = data_hash
  erb :show
end

get "/positions" do
  @team_data = data_hash.values
  erb :pos
end

get "/positions/:position" do
  @position = params[:position]
  @team_data = data_hash.values
  # binding.pry
  erb :pos_players
end
