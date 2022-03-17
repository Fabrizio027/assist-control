class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tags
  has_many :checks
  

  def admin?
    self.tags.where(:name => "Admin", :active => true).first ? true : false
  end
end
