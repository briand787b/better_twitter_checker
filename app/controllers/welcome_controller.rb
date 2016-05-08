class WelcomeController < ApplicationController
	before_action :whitelist_params

  def index 	
		unless params[:name] == nil 	
		 	limit = params[:limit].to_i
		 	@name = params[:name]
		 	if @name == '' or limit < 1
		 		flash[:notice] = "Please fill out all boxes"
		 		redirect_to index_path  	
		 	end
		 	@positive_tweets = Bot.new(@name, limit).get_tweets
		end
  end

  private

  def whitelist_params
  	params.permit(:name, :limit)
  end
end

