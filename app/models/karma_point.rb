class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value, :user
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true
  before_save :update_total_karma_points


  private

  def update_total_karma_points
    self.user.increment!(:total_karma_points, by = self.value)
    # user.total_karma_points = 10
    # user.save!
    # puts user.total_karma_points
    # puts user.inspect
  end
end
