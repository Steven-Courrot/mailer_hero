class User < ApplicationRecord
  has_many :events, through: :attendances
  validates :email, presence: true
  #has_secure_password
  #validates :encrypted_password, presence: true, length: {minimum: 6}
  validates :first_name, presence: true
  validates :last_name, presence: true
  after_create :welcome_send
      def welcome_send
        UserMailer.welcome_email(self).deliver_now
      end
end
