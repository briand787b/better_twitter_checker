CLIENT = Twitter::REST::Client.new do |config| 
	config.consumer_key = '1nZ381aZiAlJ5snuVCsSMGMkD'  #ENV['consumer_key'] 
	config.consumer_secret = 'smVhBal0RdZNN7DlXXlJq94UIvkcEextzq8UGkceHkLMjciC9E' #ENV['consumer_secret'] 
	config.access_token = '728601788367015936-xbIwWIwsbzAMSaPFsM7SHHwCLASraki' #ENV['access_token'] 
	config.access_token_secret = 'QpqobeAETXLKS7Q6Jp8k1w9IpA1P7ZcRXfMI2Sdn76qN0' #ENV['access_secret'] 
end