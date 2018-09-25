# README

Ruby version
============

Tested with ruby 2.3.1

Running
=======

The dependencies for the app are managed by Bundler.

    gem install bundler
    git clone http://github.com/ksob/freelancer_sample.git
    cd ./freelancer_sample
	bundle install
	rails db:create db:setup
	rails server

Notes
=====

It is important to run db:setup (or db:seed) rake task, as the quotes needs to be imported from the quotes site before running the app.

