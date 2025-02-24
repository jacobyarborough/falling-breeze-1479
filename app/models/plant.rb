class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def plot_plant_id(plot_id)
    plot_plants.where(plot_id: plot_id)[0].id
  end
end 