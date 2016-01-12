class Traveller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :journeys

  validates :username, uniqueness: true, presence: true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |traveller|
        traveller.provider = auth.provider
        traveller.uid = auth.uid
        traveller.email = auth.info.email
        traveller.username = auth.info.name.delete(' ') + rand(1..999).to_s
        traveller.password = "password"
      end
  end
end
