class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	# attr_accessor :remember_token
	# has_many :links
 #  class << self
	#   def from_omniauth(auth_hash)
	#     user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	#     user.name = auth_hash['info']['name']
	#     user.access_token = auth_hash['credentials']['token']
	#     # user.refresh_token = auth_hash['credentials']['refresh_token']
	#     user.expires_at = Time.at(auth_hash['credentials']['expires_at']).to_datetime
	#     user.email = auth_hash['info']['email']
	#     user.image = auth_hash['info']['image']
	#     user.url = auth_hash['info']['urls']['Google']
	#     user.gender = auth_hash['extra']['raw_info']['gender']
	#     user.save!
	#     user
	#   end
 #  end


 #  def to_params
 #    {'refresh_token' => refresh_token,
 #    'client_id' => Rails.application.secrets.client_id,
 #    'client_secret' => Rails.application.secrets.client_secret,
 #    'grant_type' => 'refresh_token' 
 #    }
 #  end
 
 #  def request_token_from_google
 #    url = URI("https://accounts.google.com/o/oauth2/token")
 #    Net::HTTP.post_form(url, self.to_params)
 #  end
 
 

 #  def refresh!
 #    response = request_token_from_google
 #    data = JSON.parse(response.body)
 #    update_attributes(
 #    access_token: data['access_token'],
 #    expires_at: Time.now + (data['expires_in'].to_i).seconds)
 #  end
 
 #  def expired?
 #    expires_at < Time.now
 #  end
 
 #  def fresh_token
 #    refresh! if expired?
 #    access_token
 #  end

 #  class << self
	#   # Returns a random token.
	#   def digest(string)
 #      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
 #                                                    BCrypt::Engine.cost
 #      BCrypt::Password.create(string, cost: cost)
 #      end
	#   def User.new_token
	#     SecureRandom.urlsafe_base64
	#   end
 #  end

 #  def remember
 #    self.remember_token = User.new_token
 #    update_attribute(:remember_digest, User.digest(remember_token))
 #  end

 #  # Returns true if the given token matches the digest.
 #  def authenticated?(remember_token)
 #    return false if remember_digest.nil?
 #    BCrypt::Password.new(remember_digest).is_password?(remember_token)
 #  end

 #  # Forgets a user.
 #  def forget
 #    update_attribute(:remember_digest, nil)
 #  end
end
