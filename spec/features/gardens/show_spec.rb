require 'rails_helper' 

RSpec.describe "garden's show page" do 
  it 'contains a unique list of plants in that garden that take less than 100 days to harvest' do 
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    plot2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    plant1 = Plant.create!(name: 'Rice', description: "edible starchy cereal grain", days_to_harvest: 89 )
    plant2 = Plant.create!(name: 'Wheat', description: "a cereal grain that yields a fine white flour used chiefly in breads", days_to_harvest: 101 )
    plant3 = Plant.create!(name: 'Maize', description: "nnual grass in the family Poaceae and is a staple food crop grown all over the world", days_to_harvest: 65 )
    plant4 = Plant.create!(name: 'Oat', description: "grass grown extensively as a grain, a cover crop and a forage crop", days_to_harvest: 120 )
    plant5 = Plant.create!(name: 'Rye', description: "domesticated cereal grass (family Poaceae) grown primarily for its edible starchy grains", days_to_harvest: 73 )
    plant6 = Plant.create!(name: 'Corn', description: "tall annual cereal grass (Zea mays) that is widely grown for its large elongated ears of starchy seeds", days_to_harvest: 120 )
    plant7 = Plant.create!(name: 'Blueberry', description: "crown forming, woody, perennial shrub in the family Ericaceae grown for its fruits", days_to_harvest: 39 )
    plot1.plants << plant1
    plot1.plants << plant2
    plot1.plants << plant3
    plot1.plants << plant4
    plot2.plants << plant4
    plot2.plants << plant5
    plot2.plants << plant6
    plot2.plants << plant7

    visit garden_path(turing_garden)
    save_and_open_page

    expect(page).to have_content(plant1.name, count:1)
    expect(page).to have_content(plant3.name, count:1)
    expect(page).to have_content(plant5.name, count:1)
    expect(page).to have_content(plant7.name, count:1)
    expect(page).not_to have_content(plant2.name)
    expect(page).not_to have_content(plant4.name)
    expect(page).not_to have_content(plant6.name)
  end 
end 