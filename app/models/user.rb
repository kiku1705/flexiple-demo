class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, format: { with: /\A^flexiple_[a-z_]+\z/, message: 'Should start with flexiple_ and only allows lowercase letters and underscore' }

  validate :password_complexity?


  def password_complexity?
  end
end