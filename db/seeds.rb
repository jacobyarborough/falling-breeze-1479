turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
plot2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
plot3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
plot4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

plant1 = Plant.create!(name: 'Rice', description: "edible starchy cereal grain", days_to_harvest: 89 )
plant2 = Plant.create!(name: 'Wheat', description: "a cereal grain that yields a fine white flour used chiefly in breads", days_to_harvest: 101 )
plant3 = Plant.create!(name: 'Maize', description: "nnual grass in the family Poaceae and is a staple food crop grown all over the world", days_to_harvest: 65 )
plant4 = Plant.create!(name: 'Oat', description: "grass grown extensively as a grain, a cover crop and a forage crop", days_to_harvest: 120 )
plant5 = Plant.create!(name: 'Rye', description: "domesticated cereal grass (family Poaceae) grown primarily for its edible starchy grains", days_to_harvest: 73 )
plant6 = Plant.create!(name: 'Corn', description: "tall annual cereal grass (Zea mays) that is widely grown for its large elongated ears of starchy seeds", days_to_harvest: 120 )
plant7 = Plant.create!(name: 'Blueberry', description: "crown forming, woody, perennial shrub in the family Ericaceae grown for its fruits", days_to_harvest: 39 )
plant8 = Plant.create!(name: 'Banana', description: "curved, yellow fruit with a thick skin and soft sweet flesh", days_to_harvest: 172 )
plant9 = Plant.create!(name: 'Almond', description: "the edible kernel of the fruit of the sweet almond tree", days_to_harvest: 58 )
plant10 = Plant.create!(name: 'Peanut', description: "small, usually erect, thin stemmed plants with feather-like leaves", days_to_harvest: 113 )
plant11 = Plant.create!(name: 'Cucumber', description: "warm season, vining, annual plant in the family Cucurbitaceae grown for its edible cucumber fruit", days_to_harvest: 73 )
plant12 = Plant.create!(name: 'Soybean', description: "herbaceous annual plant in the family Fabaceae grown for its edible seeds", days_to_harvest: 103 )

plot1.plants << plant1
plot1.plants << plant2
plot1.plants << plant3
plot1.plants << plant4

plot2.plants << plant4
plot2.plants << plant5
plot2.plants << plant6
plot2.plants << plant7

plot3.plants << plant7
plot3.plants << plant8
plot3.plants << plant9
plot3.plants << plant10

plot4.plants << plant10
plot4.plants << plant11
plot4.plants << plant12

