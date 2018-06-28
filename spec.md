 # README file contains the following sections: *
 
 Application description
 Installation guide (e.g. fork and clone repo, migrate db, bundle install, etc)
 Contributors guide (e.g. file an issue, file an issue with a pull request, etc)
 Licensing statement (e.g. This project has been licensed under the MIT open source license.)

LICENSE file is included in your repo and linked at the bottom of your README file(e.g. MIT open source license, GNU public license, Creative Commons license) *
  True

Using Ruby on Rails for the project *
  True

No scaffolding was used to build your project. *
  True

Include at least one has_many relationship (please provide example including Model names and line numbers, e.g. User has_many Recipes, User model line 3) *
 User Model - Line 10 user has_many :assignments 

Include at least one belongs_to relationship (please provide example including Model names and line numbers, e.g. Recipe belongs_to User, Recipe model line 5) *
 Assignment Model - Line 3 assignment belongs_to :user 

Include at least one has_many through relationship (please provide example including Model names and line numbers, e.g. User has_many Ingredients through Recipes, User model line 4) *
 User has_many :tasks, through: :assignments  Line 11

The "through" part of the has_many through includes at least one user submittable attribute. This field lives in the join table and needs to be able to be submitted via a form. (please provide attribute_name e.g. ingredients.quantity). *
 assignment.tasks 

Include reasonable validations for simple model objects (please provide list of model objects with validations e.g. User, Recipe, Ingredient, Item) *
 validates_presence_of :name 

Include a class level ActiveRecord scope method (please provide model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) *
 assignments.completed

Include signup (how e.g. Devise) *
 Devise 

Include login (how e.g. Devise) *
 Devise

Include logout (how e.g. Devise) *
 Devise 

Include third party signup/login (how e.g. Devise/OmniAuth, Google) *
 Facebook 

Include nested route show or index (please provide URL e.g. users/2/recipes) *
 /assignments/:assignment_id/tasks

Include nested route "new" form (please provide URL e.g. recipes/1/ingredients) *
 /assignments/:assignment_id/tasks/new

Include form display of validation errors (please provide form URL e.g. /recipes/new) *
 /assignments/new

The application is pretty DRY *
  True

Limited logic in controllers *
  True

Views use helper methods if appropriate *
  True

Views use partials if appropriate *
  True
