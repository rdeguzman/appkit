require 'spec_helper'

describe AppProfilesController do

  it "displays an error message when app_profile does not exist" do
    get :show, :id => "not-available"
    response.should redirect_to(root_path)
    flash[:alert].should eql("The application you are looking for could not be found.")
  end

end
