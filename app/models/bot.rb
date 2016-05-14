class Bot < ActiveRecord::Base
	require 'unirest'

	private
		@tweet_hash
		
		# don't really need to make this a function, but it 
		# reads better and it reinforces what an expected positive 
		# result is from the api (i.e. capitalized)
		def is_positive? tweet
			if tweet == "Positive"
				true
			else
				false
			end
	  end

	  def sentiment phrase
	  	response = Unirest.post 'https://community-sentiment.p.mashape.com/text/',
			  headers:{
			    "X-Mashape-Key" => 'SESC0i4NmRmshg3rryO7GxAy4fdDp1KsQoyjsnbEzGPUvkxXFN', #ENV["mash_key"],
			    "Content-Type" => "application/x-www-form-urlencoded",
			    "Accept" => "application/json"
			  },
			  parameters:{
			    "txt" => phrase
			  }

			return response.body["result"]["sentiment"]
	  end
	
	public
		def initialize words, limit
			set_tweets words, limit
		end

		def get_tweets
			if @tweet_hash == nil
				nil
			else
				positive_tweets = {}
				@tweet_hash.each do |k,v|
					if is_positive?(sentiment v[0])
						positive_tweets[k] = v
					end
				end
				positive_tweets
			end
		end

		def set_tweets words, limit
			@tweet_hash = {}
			if words == "" || limit < 1
				nil
			else
				CLIENT.search(words, lang: "en").take(limit).collect do |tweet|
					@tweet_hash[tweet.user.screen_name] = [tweet.text, tweet.url] 
				end 
			end
		end
end
