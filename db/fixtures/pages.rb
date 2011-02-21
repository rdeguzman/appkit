lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

Page.seed do |p|
  p.id = 1001
  p.title = "Welcome to Cebu"
  p.content = lorem_ipsum
  p.section_id = 100
end

Page.seed do |p|
  p.id = 1002
  p.title = "Deluxe Room"
  p.content = lorem_ipsum
  p.section_id = 200
end

Page.seed do |p|
  p.id = 1003
  p.title = "Executive Room"
  p.content = lorem_ipsum
  p.section_id = 200
end

Page.seed do |p|
  p.id = 1004
  p.title = "Presidential Room"
  p.content = lorem_ipsum
  p.section_id = 200
end

Page.seed do |p|
  p.id = 1005
  p.title = "Page-For-Delete"
  p.content = lorem_ipsum
  p.section_id = 200
end
