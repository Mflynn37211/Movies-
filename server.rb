require 'csv'
# require 'pry'
require 'sinatra'
require 'sinatra/reloader'

movies = []

CSV.foreach("movies.csv",headers:true,header_converters: :symbol) do |row|
  movies << row.to_hash
end

def movie_title(array)
  title = []
    array.each do |row|
      title << row[:title]
    end
    title
end


  get '/movie' do
    @titles = movie_title(movies)
    erb :home_page
end
