class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_and_belongs_to_many :coleccionistas
  has_many :mazos
  
  scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }
  scope :without_users, lambda{|users| users ? {:conditions => ["id not in (?)", users.find(:all,:select=>'id').map {|x| x.id}]} : {} }
  #find(:all,:select=>'id').map {|x| x.id}

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  def label
    "#{self.nombre} #{self.apellido}"
  end
  
end
