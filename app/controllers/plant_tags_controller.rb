class PlantTagsController < ApplicationController
  before_action :set_plant, only: [:new, :create]

  def new
    @plant_tag = PlantTag.new
  end

  def create
    #tag id
    @tags = Tag.find(params[:plant_tag][:tag])
    #save
    @tags.each do |tag|
      plant_tag = PlantTag.new(tag: tag, plant: @plant)
      plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new
    # end
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

end


# params
# {"authenticity_token"=>"w4v5UTDo1ryP_2cmYxNgAhu4caDMHMljEKxv5-ayqDy5NT3kNmfpP5MK250mtuKApPi072DEwT11ze6bkKSKsA",
# "plant_tag"=>{"tag"=>"1"},
# "commit"=>"Add tag",
# "controller"=>"plant_tags",
# "action"=>"create",
# "plant_id"=>"4"}

# params[:plant_tag] ## => {"tag"=>"1"}
# params[:plant_tag][:tag] ## => "1"
