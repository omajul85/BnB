feature 'Request' do
  before(:each) do
    User.create(
      name: 'Granny Gangster',
      username: 'theG',
      email: 'theg@granny.com',
      password: 'password',
      password_confirmation: 'password'
      )
    sign_in(email: 'theg@granny.com', password: 'password')
    expect{ create_space }.to change(Space, :count).by(1)
    sign_out
  end

  scenario 'is created by user' do
    sign_up
    expect{ create_request }.to change(Request, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Booking status: Not confirmed')
  end

end