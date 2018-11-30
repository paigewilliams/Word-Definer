require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the homepage', {:type => :feature}) do
  it('displays a form to take a word and definition') do
    visit('/')
    expect(page).to have_content('word', 'definition')
  end
end

describe('the iframe', {:type => :feature}) do
  it('processes the user input and displays the word') do
    visit('/')
    fill_in('word', :with => 'abolish')
    fill_in('definition', :with => 'formally put an end to')
    click_button('Submit')
    visit('/words')
    expect(page).to have_content('Abolish')
  end
end

describe('the definition page', {:type => :feature}) do
  it('displays the definition of the word ') do
    visit('/')
    fill_in('word', :with => 'abolish')
    fill_in('definition', :with => 'formally put an end to')
    click_button('Submit')
    visit('/definition/:id')
    expect(page).to have_content('formally put an end to')
  end
end

describe('the additional definition page', {:type => :feature}) do
  it('displays the definition of the word ') do
    visit('/')
    fill_in('word', :with => 'abolish')
    fill_in('definition', :with => 'formally put an end to')
    click_button('Submit')
    visit('/words')
    visit('/definition/:id')
    click_button('Add Additional Definition')
    visit('/add/definition/:id')
    fill_in('additional_definition', :with => 'permenantely stop')
    click_button('Add')
    expect(page).to have_content('permenantely stop')
  end
end
