user_1 = User.create(email: "Lyoung@gmail.com", username: "Lesty", password: "hi")
ex_1 = Exercise.new(name: "Pullups", reps: 10, date: DateTime.now) 
ex_1.user = user_1
ex_1.save

user_2 = User.create(email: "Jenny@gmail.com", username: "Jenny", password: "jenny")
ex_2 = Exercise.new(name: "Ran", reps: 5, date: DateTime.now) 
ex_2.user = user_2
ex_2.save
