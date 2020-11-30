
crumb :root do
  link "Home", root_path
end
crumb :mypage do
  link "マイページ", my_page_public_users_path
  parent :root
end
crumb :edit do
  link "編集", edit_public_user_path
  parent :mypage
end
crumb :user do |user|
  link "#{user.nickname}の写真一覧", public_photos_path(user)
  parent :root
end
crumb :photo_show do
  link "写真詳細", public_photo_path
  parent :root
end
crumb :photo_edit do
  link "詳細編集", edit_public_photo_path
  parent :photo_show
end

# crumb :photo_edit do
#   link "詳細", edit_public_photo_path
#   parent :user
# end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).