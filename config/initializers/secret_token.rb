# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '0f4a3e0123ba6073b58f65dddd65ce3b28ba94e5aa8a3cd296ceac90ee5234642bee3ada7ffe8987c82cdf5ec9b1f702ad0118f2f52fc7b5106fb6f764f44216'

require 'securerandom'
def secure_token
	token_file = Rails.root.join('.secret')
		if File.exist?(token_file)
			File.read(token_file).chomp
		else	
			token=SecureRandom.hex(64)
			File.write(token_file, token)
			token
		end
end
SampleApp::Application.config.secret_key_base = secure_token