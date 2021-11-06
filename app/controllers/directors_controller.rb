class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all

    render({:template => "director_templates/index.html.erb"})
  end

  def elder
    eldest_director = Director.where.not({:dob => nil}).order({ :dob => :asc}).at(0)
    @eldest_director_name = eldest_director.name
    @eldest_director_dob = eldest_director.dob.strftime("%b %d, %Y")

    render({:template => "director_templates/eldest.html.erb"})
  end

  def younger
    youngest_director = Director.where.not({:dob => nil}).order({ :dob => :desc}).at(0)
    @youngest_director_name = youngest_director.name
    @youngest_director_dob = youngest_director.dob.strftime("%b %d, %Y")

    render({:template => "director_templates/youngest.html.erb"})
  end

  def director_details
    dir_id = params.fetch("dir_id")

    @director_details = Director.where({:id => dir_id}).at(0)
    @director_name = @director_details.name
    @filmography = Movie.where({ :director_id => @director_details.id})

    render({:template => "director_templates/director_show.html.erb"})
  end

end