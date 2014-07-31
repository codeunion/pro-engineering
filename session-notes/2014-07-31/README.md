# Pro Engineering Session (Thursday, July 31)

Want to see a bit about how Ruby blocks work?  Check out

1. [wrap.rb](wrap.rb)
2. [bench.rb](bench.rb)
3. [dispatcher.rb](dispatcher.rb)

## Questions, etc.?

1. Where do all the Rails-y `rake` commands come from if they're not in the `Rakefile`?

  The Rails-specific Rake tasks are loaded by this line in the `Rakefile`:

  ```ruby
  Rails.application.load_tasks
  ```

  The various Rails gems define their own rake tasks.  For example, all the databaes-related tasks are defined by ActiveRecord.  **Remember**: to see what rake tasks are available, run

  ```console
  $ rake -T
  ```

2. Why isn't the following controller test for `LinksController` working?

  Here's the test (from `specs/controllers/links_controller_spec.rb`):

  ```ruby
  describe "GET show" do
    it "increments the link's click count" do
      link = Link.create! valid_attributes
      expect {
        get :show, { :short_name => link.to_param }, valid_session
      }.to change(link, :clicks_count).by(1)
    end
  end
  ```

  This won't work because the in-memory `Link` object in our test is _not_ the same in-memory `Link` object in the `LinksController#show` method (nor do we want it to be).  It can't be any other way, since the only piece of information our controller has is the `short_name` property.  The controller doesn't even know it's being called in a test environment.

  That said, `LinksController#show` _does_ instantiate a new `Link` object, increment `clicks_count`, and then save the data to the database. However, we created our "test `Link`" before this ever happened, so the test copy is never updated.

  To fix this, we can call `link.reload` to reload the data from the database.  This is like the mirror image of `link.save`.  That is, if `link.save` fetches whatever data is in our in-memory Ruby object and updates the database, `link.reload` fetches whatever data is in our database and updates our in-memory Ruby object.

  Here's a test that works:

  ```ruby
  describe "GET show" do
    it "increments the link's click count" do
      link = Link.create! valid_attributes
      expect {
        get :show, { :short_name => link.to_param }, valid_session
      }.to change { link.reload.clicks_count }.by(1)
    end
  end
  ```

  The difference is that we're calling

  ```ruby
  change { links.reload.clicks_count }
  ```

  instead of

  ```ruby
  change(link, :clicks_count)
  ```

  When we pass a block to the `change` method, it will call the block each time it needs to get the value.  Since we're calling `link.reload` in the block, this ensures that `link` always has the current data from the database.

  When we call it in the latter style, simply checks the value of `link.clicks_count` once before get call `get :show` and once again after to ensure that it has increased by `1`.  It has no way of knowing it's "needs" to call `link.reload`.
