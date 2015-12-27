Fabricator(:location) do
  coordinates { [Faker::Address.latitude, Faker::Address.longitude] }
  device_id   { rand(100) }
  taken_at    { Time.now }
end
