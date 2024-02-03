In this app you will list three ingredients you have in your fridge or pantry. The application will list the first 20 foods you can make with those 3 ingredients. Click on which ever food you'd like to make, and you will be given the instructions on how to make it.



Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```
