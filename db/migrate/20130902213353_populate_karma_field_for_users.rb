class PopulateKarmaFieldForUsers < ActiveRecord::Migration
  def change
    user_karma = KarmaPoint.group(:user_id).sum(:value)
    user_karma.each do |user_id, total|
      user = User.find_by_id(user_id)
      user.update_attribute :karma, total
    end
  end
end
