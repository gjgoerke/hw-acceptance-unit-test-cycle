Given /^the following movies exist:$/ do |fields|
  fields.hashes.each do |row|
    Movie.create!(row)
  end
end

Then /^the director of "Alien" should be "Ridley Scott"$/ do
  steps ( %Q{
    Then I am on the "Alien" movie update page
    Then I should see "Alien"
    Then I should see "Ridley Scott"
  })
end