def log_in_as(username, password)
  visit login_url
  fill_in "session_username", with: username
  fill_in "session_password", with: password
  click_on("commit")
end

def create_item_and_visit_root
  @item = Item.create(name: "item1", price: 1.23) 
  visit items_path
end

def create_and_select_item
  create_item_and_visit_root
  click_on "item_#{@item.id}_add"
end