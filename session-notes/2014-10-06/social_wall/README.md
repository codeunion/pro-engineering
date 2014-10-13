# The Major Files Rails Added With rails generate scaffold

## Very Important / Mandatory

- `db/migrate/20141009004732_create_posts.rb`
- `app/models/post.rb`
- `app/controllers/posts_controller.rb`
- `app/views/posts/*.html.erb`
- `config/routes.rb`

## Important, But Not Mandatory

- `app/helpers/posts_helper.rb`
- 'spec/*'
- `app/assets/*`

## Adding a Title

1. Create a new migration to add the title field
1. Modify migration file as necessary (e.g., add not null constraints)
1. Run the migration
1. Add appropriate validations to corresponding ActiveRecord model
1. Modify PostsController to permit title field
1. Add :title label and text_field to post form in `app/views/posts/_form.html.erb`
1. Modify posts/index and posts/show to display title
1. Write tests to verify your models, controllers, and views are working as you intend (like the sanity checking code).  Many people write these tests _first_.


```console
$ rails generate migration AddTitleToPosts title:string
```


