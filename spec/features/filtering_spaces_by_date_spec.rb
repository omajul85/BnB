require 'spec_helper'

feature 'Filtering spaces'  do
  before(:each) do
    User.create(name: 'Foo Bar',
      username: 'fooby',
      email: 'foo@bar.com',
      password: 'foobar',
      password_confirmation: 'foobar')
  end

  scenario 'can filter spaces by date' do
    sign_in(email: 'foo@bar.com', password: 'foobar')
    create_space(description: 'This is a test space number 1', available_from: "01/06/2016", available_to: "30/06/2016")
    create_space(description: 'This is a test space number 2', available_from: "01/12/2016", available_to: "30/12/2016")
    expect(page).to have_current_path("/")
    filter
    expect(page).to have_content('This is a test space number 2')
    expect(page).not_to have_content('This is a test space number 1')
  end

  scenario 'prints a message if no spaces found' do
    sign_in(email: 'foo@bar.com', password: 'foobar')
    create_space(description: 'This is a test space number 1', available_from: "01/06/2016", available_to: "30/06/2016")
    create_space(description: 'This is a test space number 2', available_from: "01/12/2016", available_to: "30/12/2016")
    expect(page).to have_current_path("/")
    filter(available_from: "01/08/2016", available_to: "01/09/2016")
    expect(page).to have_content('No spaces available for selected dates')
  end
end