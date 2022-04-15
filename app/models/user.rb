class User < ApplicationRecord
  attr_writer :login
  validate :validate_username
  scope :all_excluding_current_user, -> (user) {where.not(id: user)}
  after_create_commit { broadcast_append_to 'users' }
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
   # updates user list without updating page through Redis and Hotwire
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def login
  @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
