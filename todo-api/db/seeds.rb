
if User.all.blank?
  User.transaction do
    user = User.create!(username: 'yamada', email: 'yamada@gmail.com', password: 'password1')
    user.token_refresh!
    user.tasks.create!(title: 'タスク1', body: 'タスク1本文')
    user.tasks.create!(title: 'タスク2', body: 'タスク2本文')
    user.tasks.create!(title: 'タスク3', body: 'タスク3本文', completed_at: Time.current)
  end
end