class WelcomeController < ApplicationController
	before_action :whitelist_params

  def index 	
		if params[:name]
			limit = params[:limit].to_i
		 	@name = params[:name]
		 	if @name == '' or limit < 1
		 		flash[:notice] = "Please fill out all boxes"
		 		redirect_to index_path  	
		 	end
		 	@positive_tweets = Bot.new(@name, limit).get_tweets
		 	#Everything below here is new
			respond_to do |format|
				format.js {puts "HIT JS IN FORMAT 2"}
				format.html
			end
		end
  end

  private

  def whitelist_params
  	params.permit(:name, :limit)
  end
end

