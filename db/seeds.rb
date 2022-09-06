# # # # # This file should contain all the record creation needed to seed the database with its default values.
# # # # # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# # # # #
# # # # # Examples:
# # # # #
# # # # #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# # # # #   Character.create(name: "Luke", movie: movies.first)

Entity.create(name: "Hamburger", amount: 5, user_id: 1)
Entity.create(name: "Pizza", amount: 10, user_id: 1)
Entity.create(name: "Milk-shake", amount: 8, user_id: 1)
Entity.create(name: "Chicken Nuggets", amount: 10, user_id: 1)
Entity.create(name: "Chocolatey", amount: 5, user_id: 1)
Entity.create(name: "Hotdog", amount: 5, user_id: 1)
Entity.create(name: "ice-cream", amount: 2.5, user_id: 1)

Group.create(name: "KFC", icon: "bread-slice", user_id: 1)
Group.create(name: "Dominos Pizza", icon: "cheese", user_id: 1)
Group.create(name: "StarBucks", icon: "hamburger", user_id: 1)
Group.create(name: "Bradbury", icon: "hotdog", user_id: 1)
Group.create(name: "McDonalds", icon: "ice-cream", user_id: 1)

EntityGroup.create(entity_id: 1, group_id: 1)
EntityGroup.create(entity_id: 1, group_id: 5)
EntityGroup.create(entity_id: 2, group_id: 2)
EntityGroup.create(entity_id: 2, group_id: 5)
EntityGroup.create(entity_id: 3, group_id: 1)
EntityGroup.create(entity_id: 3, group_id: 3)
EntityGroup.create(entity_id: 4, group_id: 1)
EntityGroup.create(entity_id: 4, group_id: 5)
EntityGroup.create(entity_id: 5, group_id: 3)
EntityGroup.create(entity_id: 5, group_id: 4)
EntityGroup.create(entity_id: 6, group_id: 1)
EntityGroup.create(entity_id: 6, group_id: 5)
EntityGroup.create(entity_id: 7, group_id: 1)
EntityGroup.create(entity_id: 7, group_id: 3)



