class Track < ActiveRecord::Base
  validates :title, :album_id, :track_type, presence: true


  belongs_to(:album,
      :class_name => "Album",
      :foreign_key => :album_id,
      :primary_key => :id

  )

  has_many(:notes,
      :class_name => "Note",
      :foreign_key => :track_id,
      :primary_key => :id,
      dependent: :destroy
  )


  has_one :band, :through => :album, :source => :band

  def name
    self.title
  end

end
