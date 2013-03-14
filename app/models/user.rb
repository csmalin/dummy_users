class User < ActiveRecord::Base
  # Remember to create a migration!

 before_create :encrypt_password
  def authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end

  def self.login(params)
  	puts "fuck yeah"
  	puts params.inspect
  	params["password"] = Digest::SHA1.hexdigest params["password"]
  	puts self.where(:email => params["email"], :password => params["password"]).first
  	
  	!!self.where(:email => params["email"], :password => params["password"]).first
  	
  	
  end
 
  private 



  def encrypt_password
	self.password = Digest::SHA1.hexdigest self.password
  end

end
