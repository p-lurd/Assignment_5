// -----to create database--------
use inventoryDb

// -------to create all entities--------------
db.createCollection("users")
db.createCollection("orders")
db.createCollection("categories")
db.createCollection("items")
db.createCollection("items_orders")

// ----------to insert records into the entities---------
db.users.insertMany( [
    { _id: 1, name: "Tolu", email: "tolu@altschool.com", password: "7654gbh", phone_number: 2345678567, gender: "Male", created_at: Date(), role: "admin" },
    { _id: 2, name: "Dan", email: "dan@altschool.com", password: "7456ghj", phone_number: 74679875, gender: "Male", created_at: Date(), role: "admin" }
 ] );
 db.categories.insertOne({_id: 1, name: "Milks", created_at: Date()})
 db.items.insertOne({_id: 1, name: "Dano", price: 3000, size: "small", category_id: 1, user_id: 1})
 db.orders.insertOne({_id: 1, status: "pending", quantity: 3, orderDate: Date(), user_id: 1})
 db.items_orders.insertOne({_id: 1, order_id: 1, item_id: 1})

//  ----------to get records---------------
db.users.find({_id: 1})
db.categories.find()
db.items.findOne({_id: 1})

// ---------------for updating records-----------------
db.users.updateOne({_id: 1}, {$set: {name: "Toluwanimi"}})
db.categories.updateOne({_id: 1}, {$set: {name: "Cheese and Milks"}})
db.items_orders.updateOne({_id: 1}, {$set: {order_id: 2}})

// ----------------for deleting records------------------
db.users.deleteOne({_id: 2})
db.items_orders.deleteOne({_id: 1})
db.orders.deleteOne({_id: 1})

// -------------------get all items based on user_id------------------
db.items.aggregate([ { $lookup: { from: 'users', localField: 'user_id', foreignField: '_id', as :'users' }}])
