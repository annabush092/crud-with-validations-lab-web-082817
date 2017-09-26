class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, numericality: {less_than: Time.now.year}, if: :released?

  def released?
    !!self.released
  end

end
