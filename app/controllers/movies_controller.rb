class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    # Parameters: {"title"=>"up", "year"=>"2021", "duration"=>"123", "description"=>" sad story", "image"=>"no image", "director_id"=>""}

    m = Movie.new
    m.title = params.fetch("title")
    m.year = params.fetch("year")
    m.duration = params.fetch("duration")
    m.description = params.fetch("description")
    m.image = params.fetch("image")
    m.director_id = params.fetch("director_id")

    m.save

    redirect_to("/movies")

  end 

  def update
    #get the ID from params
    the_id = params.fetch("an_id")

    #look up existing record
    matching_id = Movie.where({:id => the_id})
    #get an instance of a Movie
    movie_details = matching_id.at(0)
    #update columns with the values from user input
    movie_details.title = params.fetch("title")
    movie_details.year = params.fetch("year")
    movie_details.duration = params.fetch("duration")
    movie_details.description = params.fetch("description")
    movie_details.image = params.fetch("image")
    movie_details.director_id = params.fetch("director_id")

    #save
    movie_details.save
    #redirect to show movie, we use string interpolation because this is ruby file
    redirect_to("/movies/#{movie_details.id}")
  end

  def destroy
    # Parameters: {"an_id"=>"72"}
      the_id = params.fetch("an_id")
      match_id = Movie.where({:id => the_id})
      movie_record = match_id.at(0)

      movie_record.destroy

      redirect_to("/movies")

  end
end
