# Pro Engineering Session - November 20, 2014

## Topics Covered

1. [Dynamically Defined ActiveRecord Methods](#dynamically-defined-activerecord-methods)
2. [ActiveRecord's Nested Attributes](#activerecords-nested-attributes)
3. [Nested Forms in Rails](#nested-forms-in-rails)

## Summary

We spent the session working through [Victor's Faceoff application](https://github.com/victorpearson/faceoff) because it has a relatively interesting/complex schema.  The work was done on a [fork Jesse made into his own GitHub account](http://github.com/jfarmer/faceoff) across two pull requests:

1. [Pull Request 1](https://github.com/jfarmer/faceoff/pull/1) gets `Duel#random_duel` working as expected by using some handy methods ActiveRecord defines for us (see below).
2. [Pull Request 2](https://github.com/jfarmer/faceoff/pull/2) adds a nested form to the homepage that enables user to select the winning picture in a picture faceoff.

**Note**: Jesse was a bad instructor and forgot to wrap the first handful of commits into a pull request.  Those commits [start here](https://github.com/jfarmer/faceoff/commit/24014b492d38e24bd63a5415d594317bdbea18f5) and [end here](https://github.com/jfarmer/faceoff/commit/35d811ce4ecc973225efb12b321da85b6e6bb422).  These commits were all focused on getting Twitter Bootstrap working.

### Dynamically Defined ActiveRecord Methods

In Victor's application, we created a `Duel.random_duel` class method that returns a new, unsaved `Duel` object associated with two random pictures.

```ruby
class Duel < ActiveRecord::Base
  PICTURES_PER_DUEL = 2

  belongs_to :user
  belongs_to :winning_picture, class_name: "Picture"

  has_many :duel_pictures
  has_many :pictures, through: :duel_pictures

  accepts_nested_attributes_for :duel_pictures

  validates :user, presence: true
  validates :winning_picture, presence: true

  def self.random_duel
    duel = Duel.new

    duel.picture_ids = Picture.random_ids(PICTURES_PER_DUEL)

    duel
  end
end
```

The key line is

```ruby
duel.picture_ids = Picture.random_ids(PICTURES_PER_DUEL)
```

`Picture.random_ids` is a method we defined that returns an `Array` of two random picture ids.  That is simple enough.  But what is this `duel.picture_ids=` business?  Since when did we have a `Duel#picture_ids=` method?

ActiveRecord defined this method dynamically when we declared the `has_many :pictures` association.  In fact, whenever we declare a new association, ActiveRecord defines a handful of useful collection methods related to that association.  [The official has_many documentation](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many) gives us a list of these dynamically-defined methods, although the documentation can be hard to parse.

In the code above, we made use of the `collection_singular_ids=ids` method derived from the `has_many :pictures` association.  What the documentation is saying is that when we declare

```ruby
class Machine < ActiveRecord::Base
  has_many :widgets
end
```

ActiveRecord will dynamically define a method

```ruby
some_machine.widget_ids = [1,2]
```

that sets that machine's widget collection to the `Widgets` with `ids` `1` and `2`.  In our case, this is convenient because it's relatively easy to return two random `Picture` ids.

### ActiveRecord's Nested Attributes

Sometimes we want to create multiple records associated with different ActiveRecord models all at once.  To support this, ActiveRecord has a feature called "nested attributes."  In a given model, nested attributes can be declared on a per-association basis via a

```ruby
accepts_nested_attributes_for :association_name
```

call.  [See the official documentation on accepts_nested_attributes](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html) for more examples.


When might we want to manipulate information associated with multiple models in a single request? Consider this scenario: we're creating a new blog post and tag it with brand new tags. In the request that creates the blog post we'll need to do (at least) three things:

1. Insert the hitherto-undefined tags into the database
2. Insert the blog post into the database
3. Insert the appropriate records in the join table between blog posts and tags

At first glance, our controller code will need to be more complicated than the default

```ruby
class BlogsController < ApplicationController
  def create
    @blog = Blog.create(blog_params)

    # ... etc. ...
  end
end
```

By enabling `accepts_nested_attributes_for` on the appropriate associations in the `Blog` model, our controller code can remain unchanged..

### Nested Forms in Rails

Nested forms are the yin to nested attribute's yang.  Nested forms allow us to create forms that will send data to the server in a way that plays nice with `accepts_nested_attributes_for`.

We use the `fields_for` helper to create nested forms.  See the [fields_for section on Rails Guides](http://guides.rubyonrails.org/form_helpers.html#nested-forms) — it's very instructive!

Nested forms are the one of the more complex parts of Rails and many folks will give up, opting to create their forms by hand instead of relying on the various Rails form helpers.  This is often short-sighted, resulting in brittle code that's hard to integrate with the rest of your Rails application.

To make use of nested forms, you'll need to do three things (these are all spelled out in the above-linked Rails guide — so read it!):

1. Declare `accepts_nested_attributes_for` for the appropriate ActiveRecord associations
2. Use `fields_for` to create a nested form
3. Whitelist the nested parameters in your controller

If you do all three of these things correctly, the form generated by `form_for` plus `fields_for` will send data to your Rails application in the _exact_ format that ActiveRecord expects, saving you from writing lots of tedious, error-prone, and brittle code.
