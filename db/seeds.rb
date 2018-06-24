# Workers.destroy_all
# puts "destroying workers"

puts "workers creation"

workers = [
  { first_name: 'Julie', status: "medic" },
  { first_name: 'Marc', status: "medic" },
  { first_name: 'Antoine', status: "interne" },
  { first_name: 'Emilie', status: "medic" },
  { first_name: 'Léa', status: "interim" }
]

workers.each do |worker|
  Worker.create(worker)
end

puts "workers created"
puts "shifts creation"

shifts = [
    { worker_id: 1, start_date: "2017-1-1" },
    { worker_id: 2, start_date: "2017-1-2" },
    { worker_id: 3, start_date: "2017-1-3" },
    { worker_id: 4, start_date: "2017-1-4" },
    { worker_id: 5, start_date: "2017-1-5" },
    { worker_id: 2, start_date: "2017-1-6" },
    { worker_id: 5, start_date: "2017-1-7" },
    { worker_id: 4, start_date: "2017-1-8" },
    { worker_id: 5, start_date: "2017-1-9" },
    { worker_id: 2, start_date: "2017-1-10" }
  ]

shifts.each do |shift|
  Shift.create(shift)
end

puts "shifts created"
puts "Creation finished !"
