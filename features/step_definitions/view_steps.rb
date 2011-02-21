def header
  "div.top-header"
end

def subheader
  "div.subheader"
end

def footer
  "div.footer"
end

def breadcrumbs
  "div.breadcrumbs"
end

Then /^I should see "([^"]*)" in the "([^"]*)" list$/ do |text, list_name|
  selector = "ul." + list_name
  with_scope(selector) do
    page.should have_content(text)
  end
end

Then /^I should see a notice "([^"]*)"$/ do |text|
  selector = "div.flash_notice"
  with_scope(selector) do
    page.should have_content(text)
  end
end

Then /^I should see the error "([^"]*)"$/ do |text|
  selector = "div.error_explanation"
  with_scope(selector) do
    page.should have_content(text)
  end
end

Then /^I should not see "([^"]*)" in the subheader$/ do |link|
  with_scope(subheader) do
    page.should_not have_content(link)
  end
end

Then /^I should see "([^"]*)" in the subheader$/ do |link|
  with_scope(subheader) do
    page.should have_content(link)
  end
end

Then /^I should see the link "([^"]*)" from header$/ do |link|
  with_scope(header) do
    page.should have_content(link)
  end
end

Then /^I should see the link "([^"]*)" from footer$/ do |link|
  with_scope(footer) do
    page.should have_content(link)
  end
end

Then /^I should see "([^"]*)" in the breadcrumbs$/ do |link|
  with_scope(breadcrumbs) do
    page.should have_content(link)
  end
end