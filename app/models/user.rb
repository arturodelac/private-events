class User < ApplicationRecord
  has_many :created_events, foreign_key:"creator_id",class_name:"Event"
  has_many :invitees, foreign_key: :attendee_id
  has_many :attended_events, through: :invitees
  validates :name, presence: true
  validates :last_name, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
