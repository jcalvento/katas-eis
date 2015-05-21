require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^a board with dimensions "([^"]*)" x "([^"]*)"$/) do |width, height|
  visit ''
  fill_in 'height', with: height
  fill_in 'width', with: width

  find('[type=submit]').click
end

Given(/^I create a small ship in position "([^"]*)"$/) do |position|
  split_position = position.split(':')
  fill_in 'x-small', with: split_position.first.to_i
  fill_in 'y-small', with: split_position[1].to_i

  find('#create').click
end

Then(/^position "([^"]*)" is not empty$/) do |position|
  # No se como testear que este ocupada la posicion mas que atacando.

  split_position = position.split(':')
  fill_in 'x-attack', with: split_position.first.to_i
  fill_in 'y-attack', with: split_position[1].to_i

  find('#attack').click

  expect(page).to have_css('#attack-result', :text => 'Attack result: sink')
end

Given(/^I create a large ship in position "([^"]*)"$/) do |position|
  pending
end

Given(/^I create a small ship in invalid position "([^"]*)"$/) do |position|
  pending
end

Then(/^I get an error message$/) do
  pending
end
