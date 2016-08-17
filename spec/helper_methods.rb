def log_in_as(username, password)
	visit login_url
	fill_in "session_username", with: username
	fill_in "session_password", with: password
	click_on("commit")
end