class Talk < ActiveRecord::Base
  validates :presenter, presence:true
  validates :topic, presence: true
  validate :date_is_tuesday_thursday
  # validate :five_talks_max
  validates_uniqueness_of :talk_date, scope: :talk_time

  TALK_TIMES = ['4:30PM','4:35PM','4:40PM','4:45PM','4:50PM','4:55PM']

  def date_is_tuesday_thursday
    if talk_date.strftime("%A") != "Tuesday" && talk_date.strftime("%A") != "Thursday"
      errors[:base] << "Only Tuesday or Thursday can be selected!"
    end
  end

  # def five_talks_max
  #   if
  #   end
  # end


end
