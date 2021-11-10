class PlotPlantsController < ApplicationController
  def destroy 
    plot_plants_record = PlotPlant.find(params[:id])
    plot_plants_record.destroy
    redirect_to plots_path
  end
end 