# Kaizen Documentation

### USER TYPES
There are 5 main users of this application, and each has certain rights and privileges within the application.
The first of these main users is the ADMIN.

Admins will be employees of Kaizen Health. They can sign-in or sign-up as an admin by adding the following url fragments to the end of the web address:
* to sign in “/admins/sign_in”
* to sign up “/admins/sign_up”

Admins have super-user privileges and can access all information on the website. Not only are these admins responsible for the creation of new users and rides, they can view, update, and destroy any record contained in the database.

The 4 other users (Provider, Transportation Provider, Driver, and Patient), once created, all have limited, common-sense functionality.

A Provider can:
* Log In
* View and update their profile
* Create, View, Update, and Delete a patient (provided that the patient is a * client of the Provider)
* Create, View, Update, and Delete a ride for a patient (provided that the patient is a client of the Provider)

A Transportation Provider can:
* Log In
* View and update their profile
* Create, View, Update, and Delete a driver (provided that the driver is an employee of the Transportation Provider)
* View their scheduled patient rides

A Driver can:
* Log In
* View and update their profile
* View their scheduled patient rides

A Patient can:
* Log In
* View and update their profile
* View their scheduled rides

As stated above, Admins’ super user privileges grant them the ability to do all of the aforementioned things.

### CREATING USERS

Once an Admin (or another user-type with specific create privileges) has signed in, he or she is granted the freedom to create new users. 

Creating these new users is as simple as clicking on the appropriate button on the home page. Upon the clicking of the button, a new User is created with blank information. The Admin or specially-privileged user is then responsible for filling out the forms with the appropriate information. Upon completion of the form, an email will be sent to the new user (using the given email address) with instructions on how to set-up a password for the website.

The new password email is currently sent from the test Google Mail account kaizenhealthtest@gmail.com.  We would recommend that Kaizen switch this to a noreply account with their own domain name as the address.

### SCHEDULING A RIDE

Both Admins and Providers can schedule rides for patients. To schedule a ride, navigate to the patients index and click on a particular patient. On the particular patient show screen, there is a “Schedule a Ride” button. Clicking this will take you to the form to schedule a ride.

### MAINTAINING THE DATABASE

Due to the method of user creation, there will inevitably be “empty” users in the database with little to no information. To delete these “empty” users from the database, a rake helper task has been created. When run, this rake helper task will examine the database for empty model instances, find them, and delete them. Currently, it is set-up to delete all users where the username = nil.  It can be modified to recognize any condition as empty. To do this, edit the file (which can be found in lib/tasks/cleanup.rake). 

To run this rake task on a local database, run the following command in Terminal:

``` rake cleanup:kaizen ```

For your convenience, the development team has scheduled this rake task to run every 24 hours (at 3:00am) on the production version of the web application, though the task can be run outside of this set time by simply run the following command in Terminal and replacing APPNAME with the name of the app:

``` heroku run rake cleanup:kaizen --APPNAME ```

### HEROKU ADD-ONs

There are 3 Heroku Add-Ons that are used in conjunction with the app. These add-ons can be attached to the app on the Resources screen of the Heroku Dashboard. Please note that while all of the add-ons are free, the Heroku account will need to have a credit card on file to permit adding the SendGrid and Scheduler add-ons.

* Heroku Postgres :: Database
This is the database connected to the webapp to store information.
  (https://elements.heroku.com/addons/heroku-postgresql)

* Heroku Scheduler
Scheduler allows tasks to be scheduled on pre-determined intervals. The database cleaner task is scheduled to delete “empty” users from the database every 24 hours (at 3:00am) using this add-on.
  (https://elements.heroku.com/addons/scheduler)

* SendGrid
SendGrid is a robust tool used to send emails with enhanced deliverability, manage metrics, and many other powerful functions.
  (https://elements.heroku.com/addons/sendgrid)

### APPLICATION.YML

In an application such as this, it is inevitable that admins and/or developers will want to hide certain things from users and the public at large (passwords, web tokens, etc). Keeping this in mind, the development team has installed the Figaro gem. The Figaro gem adds a line of code to the .gitignore file in the overall application folder. Every file in this folder is “ignored” by the Github service (which is the public repository for the application’s codebase). Figaro names this file application.yml.  While Figaro specifies this line of code in the .gitignore file, it does not generate the file in the overall project directory. That is the responsibility of the admin/developer. The file at can be added in the config folder of the project directory (“config/application.yml”).

One this file has been added, the admin/developer can add anything he or she wishes to remain hidden from the public. For instance, the development team added a test Kaizen gmail account to send password reset instructions and wished to keep the username and password hidden from public view. So, the following lines of code were added to the application.yml file:

gmail_username: "gmail_username"
gmail_password: “gmail_password”

And anywhere in the application that the username and password were required, the development team could simply write these lines of code:

ENV["gmail_username"],
ENV[“gmail_password”]

To “hide” this sensitive information and still have the code work. To emphasize one more time, the username and password will not be made available to public view if contained in the application.yml file. The public will see the ENV code and nothing else.

On Heroku, the process changes a bit. Since the application.yml file is “local” to a developer’s computer, Heroku has no knowledge of what any ENV[“example_code”] refers to. Thus, you have to manually add the keys and values to Heroku through the application’s portal. This can be done by visiting the application’s portal and navigating to the Settings tab. In Settings, there is a section entitled “Config Variables” with a corresponding “Reveal Config Variables” button. Once this button is clicked, one can add any ENV variables (with the left column being the ENV key i.e. gmail_username and the right column being the value i.e. kaizenhealthtest).

#### Notable gems for this app

* Devise: A flexible authentication solution for rails
https://github.com/plataformatec/devise

* Puma: A simple. quick, and concurrent web server for Ruby/Rack https://github.com/puma/puma

* Wicked: Allows forms to be built step-by-step in a controller while maintaining a RESTful look in routes
https://github.com/schneems/wicked

* Twilio-Ruby: A module for implementing the Twilio REST Api https://github.com/twilio/twilio-ruby

* Figaro: Makes securing configuration values easier for Rails apps https://github.com/laserlemon/figaro

* pg: A ruby interface for PostgreSQL
https://rubygems.org/gems/pg/versions/0.18.4

* momentjs-rails, >= 2.9.0: Wraps the moment.js library in rails for more simplistic use. https://github.com/derekprior/momentjs-rails

* bootstrap3-datetimepicker-rails, ~> 4.17.37: Works in tandem with the momentum.js gem to establish an efficient date and time picker
https://github.com/TrevorS/bootstrap3-datetimepicker-rails

* ngrok: A gem used to aid in the testing of twilio locally
https://ngrok.com/

* font-awesome-sass: A gem that allows the user to insert Font Awesome icons.

* bootstrap-sass: A gem that allows users to implement the Bootstrap HTML/CSS/Javascript framework.

