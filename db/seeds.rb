Shift.destroy_all
Worker.destroy_all
puts "destroying shifts"
puts "destroying workers"

puts "workers creation"

workers = [
  { first_name: 'Julie', last_name: 'WIECKOWSKI', status: "MEDIC" },
  { first_name: 'Marc', last_name: 'LAVOINE', status: "MEDIC" },
  { first_name: 'Antoine', last_name: 'DE CAUNES', status: "INTERN" },
  { first_name: 'Emilie', last_name: 'JOLIE', status: "MEDIC" },
  { first_name: 'Léa', last_name: 'DRUCKER', status: "INTERIM" }
]

workers.each do |worker|
  Worker.create(worker)
end

puts "workers created"
# puts "shifts creation"

# shifts = [
#     { worker_id: 1, start_date: "2017-1-1" },
#     { worker_id: 2, start_date: "2017-1-2" },
#     { worker_id: 3, start_date: "2017-1-3" },
#     { worker_id: 4, start_date: "2017-1-4" },
#     { worker_id: 5, start_date: "2017-1-5" },
#     { worker_id: 2, start_date: "2017-1-6" },
#     { worker_id: 5, start_date: "2017-1-7" },
#     { worker_id: 4, start_date: "2017-1-8" },
#     { worker_id: 5, start_date: "2017-1-9" },
#     { worker_id: 2, start_date: "2017-1-10" }
#   ]

# shifts.each do |shift|
#   Shift.create(shift)
# end

# puts "shifts created"
puts "Creation finished !"
