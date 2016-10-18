require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

	get '/' do
		erb :'index.html'
	end

  post '/users' do
    @user = User.find_by(username: params[:user_name])

    if @user == nil
      erb :'not_found.html'
    else
      redirect "/users/#{@user.id}"
    end

  end

  get '/users/new' do
    erb :'new.html'
  end

  post '/users/new' do
    @user = User.create(params[:user])

    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])

    @l_s_plain = @user.last_smoke.split("/")
    @l_s_time = Time.new(@l_s_plain[2].to_i,@l_s_plain[0].to_i, @l_s_plain[1].to_i)

    @l_s_formatted = "#{@l_s_time.strftime('%B')} #{@l_s_time.strftime('%d')}, #{@l_s_time.strftime('%Y')}."

    @now = Time.now
    @now_formatted = "#{@now.strftime('%B')} #{@now.strftime('%d')}, #{@now.strftime('%Y')}."

    @sec_diff = @now - @l_s_time
    @seconds_since = "#{@sec_diff.to_f.round}"

    mm, ss = @sec_diff.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    @days_since = "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]

    erb :'show.html'
  end

  patch '/users/:id/edit' do
    @user = User.find(params[:id])
    @user.last_smoke = params[:last_smoke]
    @user.save
    redirect "users/#{@user.id}"
  end
  # post '/' do
  #   @user = User.new(params)
  #   # binding.pry
  #   erb :days_since
  # end

end
