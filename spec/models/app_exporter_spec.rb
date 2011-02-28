require 'spec_helper'

describe AppExporter do

  it "creates a database base on the app_name, app id, version" do
    #app_name = 'Shangrila'
    #db = AppExporter.create(app_name)
    app_profile = AppProfile.find_by_app_name('Shangrila')
    app_profile.user_id.should == 1

  end

end
