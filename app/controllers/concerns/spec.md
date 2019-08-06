# Specifications for the Rails Assessment

# there's a rails helper method that makes the entry of the password unreadable or not plain text, l
# similar to text_field in formbuilder.
# -solved, I changed it to password_field_tag in the sessions new, and to password_field in the users new form_for

# make it as a user would actually use it, with a navbar and signin and signout links etc. Also there
# should be a link to sign in the regular way on the google page

# add some kind of flash message, it's unclear to the user what
# happens when they get redirected. maybe be additional- if you try to sign in, and it doesn't
# work, it doesn't say anything. you only know because the current_user method breaks, and returns nil. # happens with user1.
was working off these sources:
http://stevenleiva.com/flash-messages-in-rails
https://stackoverflow.com/questions/22566072/rails-4-flash-notice
good walkthough:
https://www.youtube.com/watch?v=jB6UXLsInUA

# the omniauth in SessionsController is still hardcoded. like when you signout, and then go to google and use it to login, it tells you 'arbitrary name'.
# -solved, I changed the code that assigns attributes to the user block variable. Now it uses
# securerandom.hex for the password, and the name is pulled to the signin candidate's auth info.

# clean up the schema, the user password column and the post user_id columns aren't necessary. but is the user id column really unnecessary? i thought that was part of linking it to the user. generally don't leave unused code around
# -solved

# make sure that authorizations are good, like you shouldn't be able to see the screen to make a new post without being logged in, even if it doesn't work when an unlogged-in user tries to make a post
<!-- posts page without being logged in, or use a user id to make a new post in the browser if you're not logged in -->
# a common live coding exercise is an ActiveRecord scope method and accompanying route
#

# it seems like it's almost a point of respect or craft pride to clean up the code before presenting it
# to someone, even if the leftover code doesn't affect the running of the program. it's like cleaning your house before visitors come over or something. or editing a story
# before turning it in to be read. you wouldn't want lots of typos, or extra lines from earlier versions of the story, or obvious plot holes if they were easily fixed.
# also it might be distracting to other people because since they didn't write the code,
# they don't already know what everything means or what to filter out.


NOTES


for next time, focus on increasing the app's functionality
-add edit and update capability. focus on routes just for Post first
-then, make sure that you're only editing posts that your user_id is attached to
(since it's fixed now so that each post actually does show the user id. so just block
access to the edit and update pages unless the same user is signed in. maybe i can
also just delete all the old posts made before this fix)

tips
-check out sinatra project, there was similar stuff
-things will be simpler if a post belongs to a user. this doesn't conflict with
things as they are now, but this structure aligns more closely with the requirements i am missing
-when i complete them then sign up for another time. can write down questions if i get too stuck. can also send a slack message or check out the study groups
-pseudocoding can be very helpful. think about 'what do i want to accomplish', helps you keep track of what you want to get done. not just 'i want this to update', but
i want to keep track of what object to update, then send it somewhere else. Like 'i want to find the post, update the post and send it somewhere else'
-reflect on the flow, where data is moving through an application. like where does this variable take its meaning, where does it go next, what is its purpose later on


Problem:
when I go to the all posts section with user 12, every post shows user 12 as its ‘post user name’. This happened with another user when I checked, and presumably is true for every user.

Related requirement
Want a user, like user 12, to only be able to delete or change posts that they themselves made. and also I want a user to be able to see all the posts that they made.

Other
Maybe any user can see any post. But to actually change it or delete it, you would have to be the same user that created it in the first place.
So there should also be a page where you see all the posts you made, or at least it could be listed on the user’s show page.

So I would need to save who makes the post, when the post is first made. I can just save the id of whatever user was logged in at that time. Like when the post create action gets fired, I can associate the

..............
<!-- this was in the sessions controller  -->

    # this method will look in our database to find any uer with that email. and
    # if someone exists who does have that email, it will use that first result. or if
    #  nobody does, it will initialize one. the difference between find and create by is that that
    #  one saves in one step as well, much like new vs create.
    # User.where(email: auth[:email]).first_or_initialize


    # before_action :require_login, only: :show
    # review skip before action to make exemptions for blanket validations
    # from before action. you can put the original before action in the application controller

    # a user should only be able to edit or change posts that they created
    # make a new branch to mess ar

    # it's very difficult to read code with lots of other stuff
    # people should be able to take it in at a glance. most coding is social and should
    # be easily understood in a group context
    # small comments can fine as like notes for future coders.
    # validate :name, presence: true

    # maybe check out 'comment conventions'
    # reach out to jen
  ---------------

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
