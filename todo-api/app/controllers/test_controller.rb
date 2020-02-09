class TestController < ApplicationController
  def index
    # テストデータの登録
    ActiveRecord::Base.transaction do
      5.times do |count|
        index = User.count + count
        user = User.new(
           email: "account#{index}@example.com",
           username: "account#{index}"
        )
        user.password = "password#{index}"
        user.save!
      end

      User.all.each do |user|
        1000.times do |count|
          index = user.tasks.count + count
          user.tasks.create!(
              title: "#{user.username}_タスク#{index}",
              body: "本文#{index}"
          )
        end
      end
    end
  end
end