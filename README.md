# Redmine member location board plugin

[![Rate at redmine.org](http://img.shields.io/badge/rate%20at-redmine.org-blue.svg?style=flat)](http://www.redmine.org/plugins/redmine_member_location_board)

This plugin provides the member location board.


## Main features
* Display project member location
* (optional) Show login ID
* (optional) Sort manually
* (optional) Display background color


# Installation notes

## Install

1. go to plugins folder
<pre>
git clone https://github.com/aki360P/redmine_member_location_board.git
</pre>
2. bundle install or change source code
<pre>
bundle install
</pre>
3. migration
<pre>
rake redmine:plugins:migrate NAME=redmine_member_location_board RAILS_ENV=production
</pre>
4. restart server

### How to skip bundle install(change source code)

* delete Gemfile in ./plugins/redmine_member_location_board
* change source code 001_create_table.rb in ./plugins/redmine_member_location_board/db/migrate.
 First line needs to be changed according to your rails version
<pre>
 class CreateTable < ActiveRecord::CompatibleLegacyMigration.migration_class
  #for redmine 3x,  class CreateTable < ActiveRecord::Migration
  #for redmine 4x,  class CreateTable < ActiveRecord::Migration[4.2]
</pre>

## UnInstall

<pre>
rake redmine:plugins:migrate NAME=redmine_member_location_board VERSION=0 RAILS_ENV=production
</pre>

# Screen shots
#### Overview
![sample screenshot](./images/screenshot01.png "overview")

#### Plugin Setting
![sample screenshot](./images/screenshot02.png "plugin setting")
