# TODO

Add a controller action that creates a User via a JSON request and return back the JSON object just created. Also, add an index action that lists out all of the current users.

The requirements for the application are as follows:

1. Add a new controller and action to create a user.
2. Create a User model that has first_name, last_name, email, social_security_number.
3. Require all fields, validate that the email is in the proper format, and that the social_security_number is 9 digits long.
4. Add an 'index' action that responds with all of the Users in the system.
5. When finished open a pull request and assign it to the owner of this repo.

Bonus:

1. Add request specs that tests both a valid and invalid call to user create.
2. Accept social security in either 000-00-0000 or 000000000 format.
