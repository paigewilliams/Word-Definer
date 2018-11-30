require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the homepage', {:type => :feature}) do
  it('processes the user input and displays the word') do
    visit('/')
    fill_in('word', :with => 'abolish')
    fill_in('definition', :with => 'formally put an end to')
    click_button('Submit')
    expect(page).to have_content('Abolish')
  end

end
