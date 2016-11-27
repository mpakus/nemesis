class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
end
