class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all

    render({:template => "actor_templates/index.html.erb"})
  end

  def actor_details
    actor_id = params.fetch("actor_id")

    @actor_details = Actor.where({:id => actor_id}).at(0)
    @characterization = Character.where({ :actor_id => @actor_details.id})

    render({:template => "actor_templates/actor_show.html.erb"})
  end

end