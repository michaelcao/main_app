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
  attr_accessible :address, :birth_date, :description, :email, :languages, :name, :school, :work, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 64 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 64 }

  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true
end
