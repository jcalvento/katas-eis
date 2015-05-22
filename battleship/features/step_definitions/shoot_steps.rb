Given(/^a large ship in position: “(\d+):(\d+)”$/) do |x, y|
  fill_in 'x-large', with: x.to_i
  fill_in 'y-large', with: y.to_i

  find('#create-large').click
end

Given(/^I shoot to position “(\d+):(\d+)”$/) do |x, y|
  fill_in 'x-attack', with: x.to_i
  fill_in 'y-attack', with: y.to_i

  find('#attack').click
end

Then(/^I get hit$/) do
  expect(find('#attack-result')).to have_content('Attack result: hit')
end

Then(/^I get water$/) do
  expect(find('#attack-result')).to have_content('Attack result: water')
end

Then(/^I get sink$/) do
  expect(find('#attack-result')).to have_content('Attack result: sink')
end

Given(/^a small ship in position: “(\d+):(\d+)”$/) do |x, y|
  fill_in 'x-small', with: x.to_i
  fill_in 'y-small', with: y.to_i

  find('#create').click
end

When(/^I shoot to position “(\d+):(\d+)” I get an error message$/) do |x, y|
  fill_in 'x-attack', with: x.to_i
  fill_in 'y-attack', with: y.to_i

  find('#attack').click

  expect(find('#attack-result')).to have_content('Attack result: invalid position')
end