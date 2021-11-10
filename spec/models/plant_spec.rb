require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe "relationships" do 
    it {should have_many(:plot_plants)}
    it {should have_many(:plots).through(:plot_plants)}
  end 

  describe 'instance methods' do 
    describe '#plot_plant_id' do 
      it 'returns the id for the plant in the plot_plant table for a specific plot' do
        turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
        plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
        plant1 = Plant.create!(name: 'Rice', description: "edible starchy cereal grain", days_to_harvest: 89 )
        plot1.plants << plant1

        expected = PlotPlant.where(plot_id: plot1.id, plant_id: plant1.id)[0].id

        expect(plant1.plot_plant_id(plot1.id)).to eq(expected)
      end 
    end 
  end 
end 