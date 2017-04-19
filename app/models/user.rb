class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, format: { with: /\Aflexiple_[a-z_]+\z/, message: 'Should start with flexiple_. Only allows lowercase letters and underscore' }
  validates :name, presence: true
  validate :password_complexity?


  def password_complexity?
    if password.present? && !password.match(/\A(?=(.*[A-Z]){2}).(?=(.*[#?!@$%^&*-_]){2}).+\z/)
      errors.add :password, 'must include at least two lowercase letters and two special characters.'
   end
  end
end
