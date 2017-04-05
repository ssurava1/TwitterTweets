class SessionsController < ApplicationController

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to twitter_new_path, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end

def twitterlogin
    credentials = request.env['omniauth.auth']['credentials']
    session[:access_token] = credentials['token']
    session[:access_token_secret] = credentials['secret']
    redirect_to show_path, notice: 'Signed in'
end

 def show
    if session['access_token'] && session['access_token_secret']
        @user = client.user_timeline(client.user, {count: 25, include_rts: true})
    else
      redirect_to failure_path
    end
end


end
