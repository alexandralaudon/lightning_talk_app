class Talk < ActiveRecord::Base
  validates :presenter, presence:true, length: { minimum: 4 }
  validates :topic, presence: true, length: { maximum: 20 }
  validates_uniqueness_of :talk_date, scope: :talk_time
  validate :date_is_tuesday_thursday
  # assert
  # validate :five_talks_max
  # has_many :fivetalksmax

  TALK_TIMES = ['4:30PM','4:35PM','4:40PM','4:45PM','4:50PM','4:55PM']

  def date_is_tuesday_thursday
    if talk_date.strftime("%A") != "Tuesday" && talk_date.strftime("%A") != "Thursday"
      errors[:base] << "Only Tuesday or Thursday can be selected!"
    end
  end

end


# class FiveTalksMax <ActiveRecord::Base
#   belongs_to :talk
#   validate :five_talks_max_count, :on => :create
#
#   def thing_count
#     talk = Talk.find(id)
#     errors.add(:base, "Exceeded Five Talks Limit") if talk.FiveTalksMax.count >= 5
#   end
# end
  #
  #
  # def five_talks_max
  #   if self.talk_date(:reload).count >= 5
  #     errors[:base] << "Sorry, people don't like you.  5 speakers already. Try again."
  #   end
  # end
