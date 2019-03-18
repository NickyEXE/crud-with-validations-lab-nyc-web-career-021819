class Song < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title, :scope => [:release_year, :artist_name]
  validate :release_year_extant?

  def release_year_extant?
    if self.released
      if !self.release_year
        errors.add(:release_year, "If it was released, it needs a release year!")
      elsif self.release_year > Date.today.year
        errors.add(:release_year, "That's in the future!")
      end
    end
  end

end
