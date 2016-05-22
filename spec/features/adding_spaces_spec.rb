require 'spec_helper'

feature 'Adding spaces'  do
	before(:each) do
    User.create(name: 'Foo Bar',
      username: 'fooby',
      email: 'foo@bar.com',
      password: 'foobar',
      password_confirmation: 'foobar')
  end

	scenario 'host can add a new space when logged in' do
    sign_in
    create_space(description: 'This is a test space')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('This is a test space')
	end
end