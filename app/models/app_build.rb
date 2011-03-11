class AppBuild < ActiveRecord::Base
  belongs_to :user
  belongs_to :app_profile
end
