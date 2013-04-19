# before do
#   redirect '/sign_up' unless session[:current_user_id] 
# end

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/home' do
  redirect '/'
end

get '/housing' do
  erb :housing
end

get '/eats' do
  erb :eats
end

get '/resources' do
  @posts = ResourcePost.all
  erb :resources
end

get '/for_sale' do
  erb :for_sale
end

get '/sign_up' do
  erb :sign_up
end

get '/login' do
  erb :login
end

post '/sign_up' do
  @user = User.create(username: params[:username], 
    password: params[:password],
    email: params[:email])
  session[:current_user_id] = @user.id
  redirect '/'
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user && @user.password == params[:password]
    session[:current_user_id] = @user.id
    erb :index
  else
    @message = "You ain't nobody."
    erb :login
  end
end

get '/logout' do
  session[:current_user_id] = nil
  redirect '/'
end

get '/create_resource_post' do
  erb :resource_post_create
end

post '/create_resource_post' do
  @resource = ResourcePost.create(title: params[:title],
    author: params[:author],
    url: params[:url],
    text: params[:text])
    erb :index
end

get '/post/:id' do
  @post = ResourcePost.find(params[:id])
  erb :post
end
