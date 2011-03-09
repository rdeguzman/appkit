class SinglePage < Page
  belongs_to :user
  belongs_to :app_profile
  has_many :pictures, :dependent => :destroy, :foreign_key => "page_id"

  validates :title, :uniqueness => {:scope => :app_profile_id}
end
