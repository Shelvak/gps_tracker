Fabricator(:device) do
  identifier { Faker::Lorem.word }
  truck_id   { rand(10) }
  enabled    true
end
