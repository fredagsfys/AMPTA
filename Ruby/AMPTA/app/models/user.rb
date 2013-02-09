class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  has_and_belongs_to_many :projects

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  # Custom validations (behövs ej)
  validates :first_name,
            :presence => {:msg => "Pleae, enter your first name."},
            :length => {:minimum => 2, :msg => "Your first name must contain at least 2 characters, max 20."}

  validates :last_name,
            :presence => {:msg => "Pleae, enter your last name."},
            :length => {:minimum => 2, :msg => "Your last name must contain at least 2 characters, max 40."}

  validates :password,
            :presence => {:msg => "Please, enter a password."},
            :length => {:minimum => 6, :msg => "The password must contain at least 6 characters, max 40."}

  validates :email,
            :presence => {:msg => "Please, enter an email address."},
            :length => {:minimum => 6, :msg => "The email address must contain at least 6 characters, max 200."}



  def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
    
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
end
