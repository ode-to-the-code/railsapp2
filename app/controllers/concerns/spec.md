# Specifications for the Rails Assessment

# there's a rails helper method that makes the entry of the password unreadable or not plain text,l
# similar to text_field in formbuilder.
# -solved, I changed it to password_field_tag in the sessions new, and to password_field in the users new form_for

# make it as a user would actually use it, with a navbar and signin and signout links etc. Also there
# should be a link to sign in the regular way on the google page

# add some kind of flash message, it's unclear to the user what
# happens when they get redirected

# the omniauth in SessionsController is still hardcoded. like when you signout, and then go to google and use it to login, it tells you 'arbitrary name'.
# -solved, I changed the code that assigns attributes to the user block variable. Now it uses
# securerandom.hex for the password, and the name is pulled to the signin candidate's auth info.

# clean up the schema, the user password column and the post user_id columns aren't necessary. but is the user id column really unnecessary? i thought that was part of linking it to the user. generally don't leave unused code around

# make sure that authorizations are good, like you shouldn't be able to see the make a new post screen
# without being logged in
<!-- posts page without being logged in, or use a user id to make a new post in the browser if you're not logged in -->
# a common live coding exercise is scope method and accompanying route

# it seems like it's almost a point of respect or craft pride to clean up the code before presenting it
# to someone, even if the leftover code doesn't affect the running of the program. it's like cleaning your house before visitors come over or something. or editing a story
# before turning it in to be read. you wouldn't want lots of typos, or extra lines from earlier versions of the story, or obvious plot holes if they were easily fixed.
# also it might be distracting to other people because since they didn't write the code,
# they don't already know what everything means or what to filter out.


NOTES

<!-- this was in the sessions controller  -->
    # this method will look in our database to find any uer with that email. and
    # if someone exists who does have that email, it will use that first result. or if
    #  nobody does, it will initialize one. the difference between find and create by is that that
    #  one saves in one step as well, much like new vs create.
    # User.where(email: auth[:email]).first_or_initialize

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object name, class method name, and a URL to see the working feature. e.g. User.most_recipes URL: /users/most_recipes)
<!-- I put a scope method in the User model, which pulls up any Users created that day  -->
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
<!-- # even if stuff is in the posts/show for example, just put in the nested route also, for the requirements  -->
Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
