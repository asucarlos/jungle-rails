class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, length: { minimum: 5 }

def self.authenticate_with_credentials(email, password)
  email = email.strip.downcase

  @user = User.find_by(email: email)
  puts email
  puts @user
  if @user && @user.authenticate(password)
    @user
    else 
    nil
  end
end

end
