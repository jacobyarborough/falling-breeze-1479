require 'rails_helper'

RSpec.describe 'plots index page' do 
  before(:each) do 
    @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    @library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
    @plot1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    @plot3 = @library_garden.plots.create!(number: 2, size: "Small", direction: "South")
    @plant1 = Plant.create!(name: 'Rice', description: "edible starchy cereal grain", days_to_harvest: 89 )
    @plant2 = Plant.create!(name: 'Wheat', description: "a cereal grain that yields a fine white flour used chiefly in breads", days_to_harvest: 101 )
    @plant3 = Plant.create!(name: 'Maize', description: "nnual grass in the family Poaceae and is a staple food crop grown all over the world", days_to_harvest: 65 )
    @plant4 = Plant.create!(name: 'Oat', description: "grass grown extensively as a grain, a cover crop and a forage crop", days_to_harvest: 120 )
    @plant5 = Plant.create!(name: 'Rye', description: "domesticated cereal grass (family Poaceae) grown primarily for its edible starchy grains", days_to_harvest: 73 )
    @plant6 = Plant.create!(name: 'Corn', description: "tall annual cereal grass (Zea mays) that is widely grown for its large elongated ears of starchy seeds", days_to_harvest: 120 )
    @plant7 = Plant.create!(name: 'Blueberry', description: "crown forming, woody, perennial shrub in the family Ericaceae grown for its fruits", days_to_harvest: 39 )
    @plant8 = Plant.create!(name: 'Banana', description: "curved, yellow fruit with a thick skin and soft sweet flesh", days_to_harvest: 172 )
    @plant9 = Plant.create!(name: 'Almond', description: "the edible kernel of the fruit of the sweet almond tree", days_to_harvest: 58 )
    @plant10 = Plant.create!(name: 'Peanut', description: "small, usually erect, thin stemmed plants with feather-like leaves", days_to_harvest: 113 )
    @plot1.plants << @plant1
    @plot1.plants << @plant2
    @plot1.plants << @plant3
    @plot1.plants << @plant4
    @plot2.plants << @plant4
    @plot2.plants << @plant5
    @plot2.plants << @plant6
    @plot2.plants << @plant7
    @plot3.plants << @plant7
    @plot3.plants << @plant8
    @plot3.plants << @plant9
    @plot3.plants << @plant10
  end

  it 'lists all plot numbers and all plants associated with a particular plot' do 
    visit plots_path

    within("#plot-#{@plot1.id}") do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to have_content(@plant4.name)
    end 
    within("#plot-#{@plot2.id}") do
      expect(page).to have_content(@plot2.number)
      expect(page).to have_content(@plant4.name)
      expect(page).to have_content(@plant5.name)
      expect(page).to have_content(@plant6.name)
      expect(page).to have_content(@plant7.name)
    end 
    within("#plot-#{@plot3.id}") do
      expect(page).to have_content(@plot3.number)
      expect(page).to have_content(@plant7.name)
      expect(page).to have_content(@plant8.name)
      expect(page).to have_content(@plant9.name)
      expect(page).to have_content(@plant10.name)
    end 
  end 

  it 'it has a link next to each plant to remove that plant from the particular plot' do
    visit plots_path

    within("#plot-#{@plot1.id}") do
      click_link "Remove #{@plant1.name}"
    end 

    expect(current_path).to eq(plots_path)

    within("#plot-#{@plot1.id}") do
      expect(page).not_to have_content(@plant1.name)
    end 
  end 
end 