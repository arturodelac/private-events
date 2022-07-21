class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :invitees, foreign_key: :attended_event_id, class_name:"Invitee"
    has_many :attendants, through: :invitees, source: :attendee
    validates :date, presence: true
    validates :title, presence: true
    validates :body, presence: true

    scope :past, -> { where('date < ?',[DateTime.now]) }
    scope :future, -> { where('date > ?',[DateTime.now]) }


   


end
