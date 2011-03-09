class Page < ActiveRecord::Base
  belongs_to :section
  belongs_to :user
  belongs_to :app_profile
  has_many :pictures, :dependent => :destroy

  validates_presence_of :title, :content

  before_save :update_ids

  def default_picture(style)
    _pictures = self.pictures
    if _pictures.count > 0
      _pictures[0].image.url(style)
    else
      'thumb_not_available.png'
    end
  end

  private
    def update_ids
      _section = self.section
      if !_section.nil?
        self.user_id = _section.user_id
        self.app_profile_id = _section.app_profile_id
      end
    end
end
