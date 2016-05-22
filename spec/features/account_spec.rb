feature 'User sign up' do
	scenario 'sign up with correct email and username' do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content('Welcome, Foo Bar')
		expect(User.first.email).to eq('foo@bar.com')
	end

  scenario 'incorrect email/username' do
    expect { sign_up_wrong }.to change(User, :count).by(0)
    expect(page).to have_content('Password does not match the confirmation')
  end

  feature 'User signs in' do
    before(:each) do
      User.create(
        name: 'Granny Gangster',
        username: 'theG',
        email: 'theg@granny.com',
        password: 'password',
        password_confirmation: 'password'
        )
      sign_in(email: 'theg@granny.com', password: 'password')
    end

    scenario 'sign in with correct email and username' do
      expect(page).to have_content('Welcome, Granny Gangster')
      expect(User.first.email).to eq('theg@granny.com')
    end

    scenario 'sign out' do
      sign_out
      expect(page).to have_content('See you soon!')
    end
  end
end