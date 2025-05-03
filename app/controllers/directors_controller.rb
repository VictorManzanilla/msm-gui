class DirectorsController < ApplicationController

  def create
    # Parameters: {"name"=>"victor", "dob"=>"2025-05-01", "bio"=>" HELLO", "image"=>"no image"}

    d = Director.new
    d.name = params.fetch("name")
    d.dob = params.fetch("dob")
    d.bio = params.fetch("bio")
    d.image = params.fetch("image")

    d.save

    redirect_to("/directors")
  end 
  
  def update
    the_id = params.fetch("an_id")
    
    matching_id = Director.where({:id => the_id})

    the_director = matching_id.at(0)

    the_director.name = params.fetch("name")
    the_director.dob = params.fetch("dob")
    the_director.bio = params.fetch("bio")
    the_director.image = params.fetch("image")

    the_director.save

    redirect_to("/directors/#{the_director.id}")

  end

  def destroy
    the_id = params.fetch("an_id")
    match_id = Director.where({:id => the_id})
    director_details = match_id.at(0) 

    director_details.destroy

    redirect_to("/directors")
  end


  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
