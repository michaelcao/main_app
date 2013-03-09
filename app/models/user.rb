# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  address       :text
#  description   :text
#  birth_date    :date
#  school        :text
#  work          :text
#  languages     :text
#  referral_code :string(255)
#  referred_code :string(255)
#  credit        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :address, :birth_date, :description, :email, :languages, :name, :school, :work, :password, :password_confirmation, :avatar
  has_secure_password
  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :thumb => "150x150>" },
                    :default_url => '/images/:attachment/default_:style.jpg'

  before_save { self.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 64 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 64 }

  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true

  #validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
