module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the app_profile page for "([^\"]*)"/
      app_profile_path(AppProfile.find_by_app_name!($1))

    when /the app_profile summary page for "([^\"]*)"/
      app_profile_summary_path(AppProfile.find_by_app_name!($1))

    when /the new section page for application "([^\"]*)"/
      app_profile = AppProfile.find_by_app_name!($1)
      new_section_path(:app_profile_id => app_profile.id)

    when /the edit section page for "([^\"]*)"/
      edit_section_path(Section.find_by_title!($1))

    when /the section page for "([^\"]*)"/
      section_path(Section.find_by_title!($1))

    when /the detail page for "([^\"]*)"/
      page_path(Page.find_by_title!($1))

    when /the admin home page/
      admin_home_path

    when /the new single_page page for "([^\"]*)"/
      app_profile = AppProfile.find_by_app_name!($1)
      new_single_page_path(:app_profile_id => app_profile.id)

    when /the single_page page for "([^\"]*)"/
      single_page_path(SinglePage.find_by_title!($1))

    when /the edit single_page page for "([^\"]*)"/
      edit_single_page_path(SinglePage.find_by_title!($1))

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
