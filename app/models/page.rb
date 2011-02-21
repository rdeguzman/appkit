class Page < ActiveRecord::Base
  belongs_to :section
  has_many :pictures, :dependent => :destroy

  validates_presence_of :title, :content

  def default_picture(style)
    _pictures = self.pictures
    if _pictures.count > 0
      _pictures[0].image.url(style)
    else
      'thumb_not_available.png'
    end
  end
end
