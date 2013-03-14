get '/' do
  # Look in app/views/index.erb
  if session['user']
		erb :user
	end
end

get '/login' do
	if session['user']
		erb :user
	end
	erb :login
end

post '/login' do
	if session['user']
		erb :user
	end
	if User.login(params["login"])
		session['user'] = Time.now()
		redirect '/user'
	end
	erb :login
end

get '/user' do
	if session['user']
		erb :user
	else
		redirect '/login'
	end
end
get '/logout' do
	redirect "/login"
end

post '/logout' do
	session.clear
	@message = "Logout successful"
	erb :login
end

get '/signup' do

	erb :sign_up
end

post '/signup' do
	if params["signup"]["password"].length < 8 
		@message = "password too short"
		erb :sign_up
	elsif params["password_again"] == params["signup"]["password"] 
		User.create(params["signup"])
		session['user'] = Time.now()
		redirect '/user'
	else
		@message = "passwords don't match"
		erb :sign_up
		#passwords don't match error
	end
end

