Fabricator(:location) do
  taken_at          { Time.now }
  device_identifier { Fabricate(:device).identifier }
  latitude          { Faker::Address.latitude }
  longitude         { Faker::Address.longitude }
end
