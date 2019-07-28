FactoryBot.define do
  factory :task do
    user
    title { 'タスクタイトル' }
    body { 'タスク本文' }
  end
end
