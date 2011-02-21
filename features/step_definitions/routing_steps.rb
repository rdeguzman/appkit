def assert_current_path(page_name)
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == url_for(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Given /^I am currently on the section page for "([^"]*)"$/ do |title|
  section = Section.find_by_title(title)
  page_name = section_path(section)
  visit url_for(page_name)
end

Given /^I am currently on the edit section page for "([^"]*)"$/ do |title|
  section = Section.find_by_title(title)
  page_name = edit_section_path(section)
  visit url_for(page_name)
end

Given /^I am currently on the section_pages page for "([^"]*)"$/ do |title|
  section = Section.find_by_title(title)
  page_name = section_pages_path(section)
  visit url_for(page_name)
end


Given /^I am currently on the new page for section "([^"]*)"$/ do |title|
  section = Section.find_by_title(title)
  page_name = new_section_page_path(section)
  visit url_for(page_name)
end

Given /^I am currently on the edit page for "([^"]*)"$/ do |title|
  page = Page.find_by_title(title)
  page_name = edit_page_path(page)
  visit url_for(page_name)
end

Given /^I am currently on the show page for "([^"]*)"$/ do |title|
  page = Page.find_by_title(title)
  page_name = page_path(page)
  visit url_for(page_name)
end
