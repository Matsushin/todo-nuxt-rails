init:
	make build
	docker-compose run api bundle exec rails db:create
	docker-compose run api bundle exec rails db:migrate
	docker-compose run api bundle exec rails db:seed
build:
	docker-compose build
	make install
install:
	docker-compose run api bundle install
	docker-compose run web npm install
up:
	docker-compose up
down:
	docker-compose down
stop:
	docker-compose stop
restart:
	docker-compose up
	docker-compose stop
back-bash:
	docker-compose exec api bash
front-bash:
	docker-compose exec web bash
lint-fix:
	docker-compose exec web npm run lint-fix
jest:
	docker-compose exec web npm run test

# 不要なイメージと使われていないvolumeを削除
clean:
	docker image prune
	docker volume prune

# database
db-create:
	docker-compose exec api bundle exec rails db:create
db-drop:
	docker-compose exec api bundle exec rails db:drop
db-migrate:
	docker-compose exec api bundle exec rails db:migrate
db-seed:
	docker-compose exec api bundle exec rails db:seed
db-reset:
	docker-compose exec api bundle exec rails db:drop db:create db:migrate db:seed

# rails command
rc:
	docker-compose exec api bundle exec rails console
rr:
	docker-compose exec api bundle exec rails routes
rt:
	docker-compose exec api_web_1 bundle exec rails test

# for use binding.pry
attach:
	docker attach todo-api_web_1
