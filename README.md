# Sweety
[![Code Climate](https://codeclimate.com/github/pweisensee/Sweety/badges/gpa.svg)](https://codeclimate.com/github/pweisensee/Sweety)

CodeTheory - a simple web application which enables a user to input and 
track blood glucose readings and view reports on those readings.

![alt text](https://raw.githubusercontent.com/pweisensee/Sweety/master/app/assets/images/4-26.png "Preview")

## Development Environment
* OS: Ubuntu 15.10 (64-bit)
* IDE: RubyMine 2016.1

##Installation

1. Running a fresh install of Ubuntu 15.10

2. Install some dependencies for Ruby:

	sudo apt-get update

	sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

3. Install Ruby via rbenv:

	* cd

	* git clone https://github.com/rbenv/rbenv.git ~/.rbenv

	* echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

	* echo 'eval "$(rbenv init -)"' >> ~/.bashrc

	* exec $SHELL

	* git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

	* echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

	* exec $SHELL

	* git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

	* rbenv install 2.3.0

	* rbenv global 2.3.0

	* ruby -v

4. Install Bundler gem:

	* gem install bundler

5. Install NodeJS version 4

	* curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

	* sudo apt-get install -y nodejs

6. Configure Git

	* git config --global color.ui true
	* git config --global user.name "NAME"
	* git config --global user.email "YOUR@EMAIL.com"
	* ssh-keygen -t rsa -C "YOUR@EMAIL.com"

7. Install Rails version 4:

	* gem install rails -v 4.2.4

	* rbenv rehash

## Running locally

1. Download/extract

2. Navigate to directory

3. Run to setup database:
   * 'rake db:create'
   * 'rake db:migrate'
   * 'rake db:seed' (optional)

4. Run 'rails s'

4. Open [http://localhost:3000/](http://localhost:3000/)

5. Seeded Login credentials (optional):
   * Email: 'u0@gmail.com'
   * Password: 'test1234'
