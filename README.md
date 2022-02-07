
[![Hot Glue](https://circleci.com/gh/jasonfb/hot-glue.svg?style=shield)](https://circleci.com/gh/jasonfb/hot-glue)

Hot Glue is a Rails scaffold builder for the Turbo era. It is an evolution of the admin-interface style scaffolding systems of the 2010s ([activeadmin](https://github.com/activeadmin/activeadmin), [rails_admin](https://github.com/sferik/rails_admin), and [active_scaffold](https://github.com/activescaffold/active_scaffold)).

Using Turbo-Rails and Hotwire (default in Rails 7) you get a lightning-fast out-of-the-box CRUD building experience.

Every page displays only a list view: new and edit operations happen as 'edit-in-place', so the user never leaves the page.

Because all page navigation is Turbo's responsibilty, everything plugs & plays nicely into a Turbo-backed Rails app.

Alternatively, you can use this tool to create a Turbo-backed *section* of your Rails app-- like an admin interface -- while still treating the rest of the Rails app as an API or building out other features by hand.

It will read your relationships and field types to generate your code for you, leaving you with a 'sourdough starter' to work from. If you modify the generated code, you're on your own if you want to preserve your changes and also re-generate scaffold after adding fields.

By default, it generates code that gives users full control over objects they 'own' and by default it spits out functionality giving access to all fields.

Hot Glue generates functionality that's quick and dirty. It lets you be crafty. As with a real hot glue gun, use with caution.

* Build plug-and-play scaffolding mixing generated ERB with the power of Hotwire and Turbo-Rails
* Everything edits-in-place (unless you use `--big-edit`, then it won't)
* Automatically Reads Your Models (make them AND migrate your DB before building your scaffolding!)
* Excellent for CREATE-READ-UPDATE-DELETE (CRUD), lists with pagination (coming soon: searching & sorting)
* Great for prototyping, but you should learn Rails fundamentals first.
* 'Packaged' with Devise, Kaminari, Rspec, FontAwesome
* Create system specs automatically along with the generated code.
* Nest your routes model-by-model for built-in poor man's authentication.
* Throw the scaffolding away when your app is ready to graduate to its next phase.

# Hot Glue Tutorial 
## [GET THE COURSE TODAY (includes Hot Glue License)](https://jfbcodes.com/courses/hot-glue-in-depth-tutorial/?utm_source=github.com&utm_campaign=github_hot_glue_readme_page) **only $60 USD!**

|   |  |  
| ------------- | ------------- |
| ![Teachable-225x225](https://user-images.githubusercontent.com/59002/147857335-a919e095-e6de-4718-8513-736d1f283a0b.png)  | Now avaiale on [Teachable](https://jfb.teachable.com/courses/hot-glue-in-depth-tutorial/?utm_source=github.com&utm_campaign=github_hot_glue_readme_page)  |





## HOW EASY?

```
rails generate hot_glue:scaffold Thing 
```

Generate a quick scaffold to manage a table called `pronouns`
![hot-glue-3](https://user-images.githubusercontent.com/59002/116405509-bdee2f00-a7fd-11eb-9723-4c6e22f81bd3.gif)

Instantly get a simple CRUD interface

![hot-glue-4](https://user-images.githubusercontent.com/59002/116405517-c2b2e300-a7fd-11eb-8423-d43e3afc9fa6.gif)

# Getting Started

_If you are on Rails 6, see [LEGACY SETUP FOR RAILS 6](https://github.com/jasonfb/hot-glue/README2.md) and complete those steps FIRST._


## 1. Rails 7 New App

There are two ways to create new apps on Rails 7: With or without ImportMap. These instructions prefer the **without Importmap** method, but to help you choose [see this post](https://jasonfleetwoodboldt.com/courses/stepping-up-rails/rails-7-do-i-need-importmap-rails/)

`rails new --css=bootstrap --javascript=webpack --database=postgresql`

Confirm that both Stimulus and Turbo are working. For the quick step-by-step to help you confirm 
that both Stimulus and Turbo are working for your new JSBundling-Rails/CSSBunlding-Rails setup [see this post](https://jasonfleetwoodboldt.com/courses/stepping-up-rails/rails-7-new-app-with-js-bundling-css-bundling/).

(Note that Bootstrap is optional for Hot Glue. Here, I am just showing you the default isntallation for simplicity.)

For the old method of installing Bootstrap [see this post](https://jasonfleetwoodboldt.com/courses/stepping-up-rails/rails-7-bootstrap/)

Remember, for Rails 6 you must go through the [LEGACY SETUP FOR RAILS 6](https://github.com/jasonfb/hot-glue/README2.md) before continuing. 

## 2. ADD RSPEC, FACTORY-BOT, AND FFAKER

add these 3 gems to your gemfile **inside a group for both :development and :test*. Do not add these gems to only the :test group or else your will have problems with the generators.
```
gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'ffaker'
```

- run `rails generate rspec:install`



## 3. HOTGLUE INSTALLER
Add `gem 'hot-glue'` to your Gemfile & `bundle install`

Purchase a license at https://heliosdev.shop/hot-glue-license

During in installation, you MUST supply a `--layout` flag.

### `--layout` flag (NOTE: haml and slim are no longer supported at this time)
Here you will set up and install Hot Glue for the first time. It will install a config file that will save two preferences: layout (hotglue or bootstrap) and markup (erb or haml or slim).

Once you run the installer, the installer will save what you set it to in `config/hot_glue.yml`. Newly generated scaffolds will use these two settings, but you can modify them just by modifying the config file (you don't need to re-run the installer)

If you do NOT specify `--layout=bootstrap`, then `hotglue` will be assumed. When constructing scaffold with bootstrap layout (at this time Hot Glue peeks into config/hot_glue.yml to see what you've set there), your views come out with divs that have classes like .container-fluid, .row, and .col. You'll need to install Bootstrap separately, any way you like, but jQuery is not required as Hot Glue does not rely on jQuery-dependant Bootstrap features.


If instead you install Hot Glue (or switch the setting) using the default layout mode (`--layout=hotglue`),
your scaffolding will be built using no-Bootstrap syntax: It has its own syntax with classes like
`.scaffold-container`,
`.scaffold-list`,
`.scaffold-row`, and
`.scaffold-cell`

During the installation, if your `--layout` flag is left unspecified or set to `hotglue` you must also pass `--theme` flag.

the themes are:
• like_mountain_view (Google)
• like_los_gatos (Netflix)
• like_bootstrap (bootstrap 4 copy)
• dark_knight (_The Dark Night_ (2008) inspired)
• like_cupertino (modern Apple-UX inspired)
• gradeschool (spiral bound/lined notebook inspired)

Please note that the scaffold is ** built with different market up for boostrap**, so you cannot switch between the Bootstrap and Hotglue layouts without rebuilding the scaffold.

(On the other hand, if you build within the Hotglue layout, all of the Hotglue theme files CAN be swapped out without rebuilding the scaffold.)

The themes are just SCSS files installed into app/assets/stylesheets. You can tweak or modify or remove them after they get installed.


### `--markup` flag

default is `erb`. IMPORTANT: As of right now, I am only supporting & building against ERB. HAML and SLIM are not currently supported.


## 3. RUN HOT-GLUE INSTALL:
### example installing ERB using Bootstrap layout:
`rails generate hot_glue:install --markup=erb --layout=bootstrap`

### Example installing HAML using Hot Glue layout and the 'like_mountain_view' (Gmail-inspired) theme:
`rails generate hot_glue:install --markup=erb --layout=hotglue --theme=like_mountain_view`

The Hot Glue installer did several things for you in this step. Examine the git diffs or see 'Hot Glue Installer Notes' below.


## 4. install font-awesome (optional)

I recommend
https://github.com/tomkra/font_awesome5_rails
or
https://github.com/FortAwesome/font-awesome-sass


## 5. Devise

(or only use --gd mode, see below)

Add to your Gemfile

As of 2022-01-26 Devise for Rails 7 is still not released so you must use **main branch**, like so:

`gem 'devise', branch: 'main', git: 'https://github.com/heartcombo/devise.git'`

(If you are on Rails 6, you must do ALL of the steps in the Legacy Setup steps. Be sure not to skip **Legacy Step #5** (below))

For Rails 7, be sure you are on the main branch of devise above and your logins should work. (The previously necessary step of disabling turbo shown in Legacy Step #5 is no longer needed. )

You MUST run the installer FIRST or else you will put your app into a non-workable state:
```
rails generate devise:install
```

IMPORTANT: Follow the instructions the Devise installer gives you, *Except Step 3*, you can skip this step:
```
 3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

```

Be sure to create primary auth model with:

`rails generate devise User name:string`

Remember, you don't need to tell Devise that your User has an email, an encrypted password, a reset token, and a 'remember me' flag to let the user stay logged in.

Those features come by default with Devise, and you'll find the fields for them in the newly generated migration file. 

In this example above, you are creating all of those fields along with a simple 'name' (string) field for your User table.




### Hot Glue Installer Notes 

These things were **done for you** in Step #3 (above). You don't need to think about them but if you are familiar with Capybara and/or adding Hot Glue to an existing app, you may want to:

####  Hot Glue modified `application.html.erb`
Note: if you have some kind of non-standard application layout, like one at a different file
or if you have modified your opening <body> tag, this may not have been automatically applied by the installer.

- This was added to your `application.html.erb`
```
  <%= render partial: 'layouts/flash_notices' %>
```

#### Hot Glue modified `rails_helper.rb`
Note: if you have some kind of non-standard rails_helper.rb, like one that does not use the standard ` do |config|` syntax after your `RSpec.configure`
this may not have been automatically applied by the installer.

- configure Rspec to work with Factory Bot inside of `rails_helper.rb`
  ```
  RSpec.configure do |config|
      // ... more rspec configuration (not shown)
      config.include FactoryBot::Syntax::Methods
  end
  ```  


#### Hot Glue switched Capybara from RACK-TEST to HEADLESS CHROME

- By default Capybara is installed with :rack_test as its driver.
- This does not support Javascript, and the code from Hot Glue IS NOT fallback compatible-- it will not work on non-Javascript browsers.
- From the [Capybara docs](https://github.com/teamcapybara/capybara#drivers):
```
By default, Capybara uses the :rack_test driver, which is fast but limited: it does not support JavaScript
```

- To fix this, you must switch to a Javascript-supporting Capybara driver. You can choose one of:

`Capybara.default_driver = :selenium`
`Capybara.default_driver = :selenium_chrome`
`Capybara.default_driver = :selenium_chrome_headless`

By default, the installer should have added this option to your `rails_helper.rb` file:

```
Capybara.default_driver = :selenium_chrome_headless 
```

Alternatively, you can define your own driver like so:

  ```
  Capybara.register_driver :my_headless_chrome_desktop do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1280,1200')
    
    driver = Capybara::Selenium::Driver.new(app,
                                            browser: :chrome,
                                            options: options)
    
    driver
  end
  Capybara.default_driver = :my_headless_chrome_desktop
    
  ```

#### Hot Glue Added a Quick (Old-School) Capybara Login For Devise

- for a quick Capybara login, create a support helper in `spec/support/` and log-in as your user
- in the default code, the devise login would be for an object called account and lives at the route `/accounts/sign_in`
- modify the generated code (it was installed by the installed) for your devise login
   ```
   def login_as(account)
     visit '/accounts/sign_in'
     within("#new_account") do
     fill_in 'Email', with: account.email
     fill_in 'Password', with: 'password'
     end
     click_button 'Log in'
   end
   ```

---
---


# HOT GLUE DOCS

## First Argument
(no double slash)

TitleCase class name of the thing you want to build a scaffoling for.


## Options With Arguments

All options two dashes (--) and these take an `=` and a value

### `--namespace=`

pass `--namespace=` as an option to denote a namespace to apply to the Rails path helpers


`rails generate hot_glue:scaffold Thing --namespace=dashboard`

This produces several views at `app/views/dashboard/things/` and a controller at`app/controllers/dashboard/things_controller.rb`

The controller looks like so:

```
class Dashboard::ThingsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_thing, only: [:show, :edit, :update, :destroy]
  def load_thing
    @thing = current_user.things.find(params[:id])
  end
  ...
end

```


### `--nested=`

This object is nested within another tree of objects, and there is a nested route in your `routes.rb` file. When specifying the parent(s), be sure to use **singular case**.

#### Example #1: One-level Nesting
Invoice `has_many :lines` and a Line `belongs_to :invoice`

```
resources :invoices do
  resource :lines do
end
```

`rails generate hot_glue:scaffold Invoice`

`rails generate hot_glue:scaffold Line --nested=invoice`


Remember, nested should match how the hierarchy of nesting is in your `routes.rb` file. (Which Hot Glue does not create or edit for you.)

#### Example #2: Two-level Nesting

Invoice `has_many :lines` and a Line `belongs_to :invoice`
Line `has_many :charges` and Charge `belongs_to :line`

**config/routes.rb**
```
resources :invoices do
    resources :lines do
        resources :charge
    end    
end
```


_For multi-level nesting use slashes to separate your levels of nesting._

`rails generate hot_glue:scaffold Invoice`

`rails generate hot_glue:scaffold Line --nested=invoice`

`rails generate hot_glue:scaffold Charge --nested=invoice/line`



For non-Gd controllers, your auth root will be used as the starting point when loading the objects from the URL if this object is nested.

(For Gd controllers the root object will be loaded directly from the ActiveRecord object.)

In the example above, @invoice will be loaded from

`@invoice = current_user.invoices.find(params[:invoice_id])`

Then, @line will be loaded

`@line = @invoice.lines.find(params[:line_id])`

Then, finally the @charge will be loaded

`@charge = @line.charges.find(params[:id])`

This is "starfish access control" or "poor man's access control."  It works when the current user has several things they can manage, and by extension can manage children of those things.  

                                                         
### `--auth=`

By default, it will be assumed you have a `current_user` for your user authentication. This will be treated as the "authentication root" for the "poor man's auth" explained above.

The poor man's auth presumes that object graphs have only one natural way to traverse them (that is, one primary way to traverse them), and that all relationships infer that a set of things or their descendants are granted access to me for reading, writing, updating, and deleting.

Of course this is a sloppy way to do access control, and can easily leave open endpoints your real users shouldn't have access to.

When you display anything built with the scaffolding, we assume the `current_user` will have `has_many` association that matches the pluralized name of the scaffold. In the case of nesting, we will automatically find the nested objects first, then continue down the nest chain to find the target object. In this way, we know that all object are 'anchored' to the logged-in user.

If you use Devise, you probably already have a `current_user` method available in your controllers. If you don't use Devise, you can implement it in your ApplicationController.

If you use a different object other than "User" for authentication, override using the `auth` option.

`rails generate hot_glue:scaffold Thing --auth=current_account`

You will note that in this example it is presumed that the Account object will have an association for `things`

It is also presumed that when viewing their own dashboard of things, the user will want to see ALL of their associated things.

If you supply nesting (see below), your nest chain will automatically begin with your auth root object (see nesting)

#### Optionalized Nested Parents

Add `~` in front of any nested parameter (any parent in the `--nest` list) you want to make optional. This creates a two-headed controller: It can operate with or without that optionalized parameter. 

This is an advanced feature is to use two duplicitous routes to the same controller.  You can only use this feature with Gd controller.  To use, specify your controller *twice* in your routes.rb. Then, in your `--nest` setting, add `~` to any nested parent you want to **make optional**. "Make optional" means the controller will behave as-if it exists in two places: once, at the normal nest level.  Then the same controller will 'exist' again one-level up in your routes. **If the route has sub-routes, you'll need to re-specify the entire subtree also**.
```
namespace :admin
  resources :users do
    resources :invoices
  end
  resoures :invoices
end
```
Hot Glue will build the scaffolding once for users and once again for invoice. Even though we have two routes pointed to invoices, 
```
rails generate hot_glue:scaffold User --namespace=admin --gd --downnest=invoices
rails generate hot_glue:scaffold Invoice --namespace=admin --gd --nest=~users
```
Notice for the Invoice build, the parent user is *optionalized* (not 'optional'-- optionalized: to be made so it can be made optional).  The Invoices controller, which is a Gd controller, will load the User if a user is specified in the route (`/admin/users/:user_id/invoices/`). It will ALSO work at `/admin/invoices` and will switch back into loading directly from the base class when routed this way.




### `--auth_identifier=`

Your controller will call a method authenticate_ (AUTH IDENTIFIER) bang, like:

`authenticate_user!`

Before all of the controller actions. If you leave this blank, it will default to using the variable name supplied by auth with "current_" stripped away.
(This is setup for devise.)

Be sure to implement the following method in your ApplicationController or some other method. Here's a quick example using Devise. You will note in the code below, user_signed_in? is implemented when you add Devise methods to your User table.

As well, the `after_sign_in_path_for(user)` here is a hook for Devise also that provides you with after login redirect to the page where the user first intended to go.

```
  def authenticate_user!
    if ! user_signed_in?
      session['user_return_to'] = request.path
      redirect_to new_user_registration_path
    end
  end

  def after_sign_in_path_for(user)
    session['user_return_to'] || account_url(user)
  end
```


The default (do not pass `auth_identifier=`) will match the `auth` (So if you use 'account' as the auth, `authenticate_account!` will get invoked from your generated controller; the default is always 'user', so you can leave both auth and auth_identifier off if you want 'user')


`rails generate hot_glue:scaffold Thing --auth=current_account --auth_identifier=login`
In this example, the controller produced with:
```
   before_action :authenticate_login!
```
However, the object graph anchors would continue to start from current_account. That is,
```
@thing = current_account.things.find(params[:id])
```

Use empty string to **turn this method off**:
`rails generate hot_glue:scaffold Thing --auth=current_account --auth_identifier=''`

In this case a controller would be generated that would have NO before_action to authenticate the account, but it would still treat the current_account as the auth root for the purpose of loading the objects.

Please note that this example would product non-functional code, so you would need to manually fix your controllers to make sure `current_account` is available to the controller.


### `--plural=`

You don't need this if the pluralized version is just + "s" of the singular version. Only use for non-standard plurlizations, and be sure to pass it as TitleCase (as if you pluralized the model name which is non-standard for Rails)


### `--exclude=`
(separate field names by COMMA)

By default, all fields are included unless they are on the exclude list. (The default for the exclude list is `id`, `created_at`, and `updated_at`  so you don't need to exclude those-- they are added.)

If you specify an exclude list, those and the default excluded list will be excluded.


`rails generate hot_glue:scaffold Account --exclude=password`

(The default excluded list is: :id, :created_at, :updated_at, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email. If you want to edit any fields with the same name, you must use the include flag instead.)


### `--include=`
Separate field names by COMMA

If you specify an include list, it will be treated as a whitelist: no fields will be included unless specified on the include list.

`rails generate hot_glue:scaffold Account --include=first_name,last_name,company_name,created_at,kyc_verified_at`

You may not specify both include and exclude.

Include setting is affected by both specified grouping and smarty layouts, explained below.


#### Specified Grouping Mode

To specify grouped columns, separate COLUMNS by a COLON, then separate fields with commas. Specified groupings work like smart layouts (see below), except you drive which groupings make up the columns. 

(Smarty layouts, below, achieves the same effect but automatically groups your fields into a smart number of columns. ) 

If you want to group up fields together into columns, use a COLON (`:`) character to specify columns.

Your input **may** have a COLON at the end of it, but otherwise your columns will made **flush left**.

Without specified grouping (and not using smart layout), no group will happen, so these two fields would display in two columns:
`--include=api_id,api_key`

With a trailing colon you would be specifying the grouping. You're telling Hot Glue to make the two fields into column #1. (There is no other column.)
`--include=api_id,api_key:`


If, for example, you wanted to put the `name` field into column #1 and then the api_id and api_key into column #2, you would use:
`--include=name:api_id,api_key`



Specifying any colon in your include syntax switches the builder into specified grouping mode. The effect will be that the fields will be stacked together into nicely fit columns. (This will look confusing if your user expect an Excel-like interface.)

With Bootstrap in specified grouping or smart layout mode, it automatically attempts to fit everything into 12-columns. 

Using Bootstrap with neither specified grouping nor smart layouts may make 12 columns, which will produce strange result. (Bootstrap is not designed to work with, for example, a 13-column layout.)

You should typically either specify your grouping or use smart layouts when building with Bootstrap, but if your use case does not fit the stacking feature you can specify neither and then you may have deal with the over-stuffed layouts as explained above. 



### `--smart-layout` mode (automatic grouping) (default: false)

Smart layouts are like specified grouping but Hot Glue does the work of figuring out how many fields you want in each column. 

It will concatinate your fields into groups that will fit into the Bootstraps 12-column grid.

The effect will be that the fields will be stacked together into nicely fit columns.

**Some people expect each field to be a column and think this looks strange.**

**If your customer is used to Excel, this feature will confuse them.**

Also, this feature will **probably not** be supported by the SORTING (not yet implemented; TBD). I'm not really sure it makes sense to build a non-columnar layout with sorting, so I think I **probably won't support smart layouts** if you want sorting. (You will be forced to choose between the two which I think makes sense.)

The layout builder works from right-to-left and starts with 12, the number of Bootstrap's columns.

It reserves 2 columns for the default buttons. Then +1 additional column for **each magic button** you have specified.

Then it takes 4 columns for **each downnested portal**.

If you're keeping track, that means we may have used 6 to 8 out of our Bootstrap columns already if we have buttons & portals. (With no portals and no magic buttons you have a nice even 10 columns to work with.)

If we have 2 downnested portals and only the default buttons, that uses 10 out of 12 Bootstrap columns, leaving only 2 bootstrap columns for the fields.

THe layout builder takes the number of columns left and then distributes the feilds 'evenly' among them. However, note that order specified translates to up-to-down within the column, and then left-to-right across the columns, like so:

A D G

B E H

C F I

This is what would happen if 9 fields, specified in the order A,B,C,D,E,F,G,H,I, were distributed across 3 columns. 

(If you had a number of fields that wasn't easily divisible by the number of columns, it would leave the final column a few fields short of the others.)



### `--show-only=`
(separate field names by COMMA)

Any fields only the 'show-only' list will appear as non-editable on the generate form. (visible only)

IMPORTANT: By default, all fields that begin with an underscore (`_`) are automatically show-only.

I would recommend this for fields you want globally non-editable by users in your app. For example, a counter cache or other field set only by a backend mechanism.

### `--ujs_syntax=true` (Default is set automatically based on whether you have turbo-rails installed)

If you are pre-Turbo (UJS), your delete buttons will come out like this:
`data: {'confirm': 'Are you sure you want to delete....?'}`

If you are Turbo (Rails 7 or Rails 6 with proactive Turbo-Rails install), your delete button will be:
`data: {'turbo-confirm': 'Are you sure you want to delete....?'}`

If you specify the flag, you preference will be used. If you leave the flag off, Hot Glue will detect the presence of Turbo-Rails in your app. 

**WARNING**: If you created a new Rails app since October 2021 and you have the yanked turbo-rails Gems on your local machine, 
you will have some bugs with the delete buttons and also not be on the latest version of turbo-rails.

Make sure to uninstall the yanked 7.1.0 and 7.1.1 from your machine with `gem uninstall turbo-rails`
and also fix any Rails apps created since October 2021 by fixing the Gemfile. Details here:
https://stackoverflow.com/questions/70671324/new-rails-7-turbo-app-doesnt-show-the-data-turbo-confirm-alert-messages-dont-f


### `--magic-buttons` 
If you pass a list of magic buttons (separated by commas), they will appear in the button area on your list.

It will be assumed there will be corresponding bang methods on your models.

The bang (`!`) methods can respond in one of four ways:

• With true, in which case a generic success message will be shown in the flash notice (“Approved” or “Rejected” in this case)

• With false, in which case a generic error message will be shown in the flash alert (“Could not approve…”)

• With a string, which will be assumed to be a “success” case, and will be passed to the front-end in the alert notice.

• Raise an ActiveRecord exception

This means you can be a somewhat lazy about your bang methods, but keep in mind the truth operator compares boolean true NOT any object is truth. So your return object must either be actually true (boolean), or an object that is string or string-like (responds to .to_s). Want to just say it didn’t work? Return false. Want to just say it was OK? Return true. Want to say it was successful but provide a more detailed response? Return a string.

Finally, you can raise an ActiveRecord error which will also get passed to the user, but in the flash alert area

For more information see Example 5 in the Tutorial


### `--downnest`

Automatically create subviews down your object tree. This should be the name of a has_many relationship based from the current object.
You will need to build scaffolding with the same name for the related object as well. On the list view, the object you are currently building will be built with a sub-view list of the objects related from the given line.

The downnested child table (not to be confused with this object's `--nested` setting, where you are specifying this object's _parents_) is called a **child portal**. When you create a record in the child portal, the related record is automatically set to be owned by its parent (as specified by `--nested`). For an example, see the [v0.4.7 release notes](https://github.com/jasonfb/hot-glue/releases/tag/v0.4.7).
 



## FLAGS (Options with no values)
These options (flags) also uses `--` syntax but do not take any values. Everything is assumed (default) to be false unless specified.

### `--god` or `--gd`

Use this flag to create controllers with no root authentication. You can still use an auth_identifier, which can be useful for a meta-leval authentication to the controller.

For example, FOR ADMIN CONTROLLERS ONLY, supply a auth_identifier and use `--god` flag.

In Gd mode, the objects are loaded directly from the base class (these controllers have full access)
```
def load_thing
    @thing = Thing.find(params[:id])
end

```


### `--specs-only`

Produces ONLY the controller spec file, nothing else.


### `--no-specs`

Produces all the files except the spec file.


### `--no-paginate`

Omits pagination. (All list views have pagination by default.)

### `--no-list`

Omits list action. Only makes sense to use this if you are create a view where you only want the create button you want to navigate to the update screen alternative ways.


### `--no-list-labels`

Omits list labels. (note that in the form the labels are rendered again anyway)

### `--no-create`

Omits create action.

### `--no-delete`

Omits delete action.

### `--big-edit`

If you do not want inline editing of your list items but instead to fall back to full page style behavior for your edit views, use `--big-edit`. Turbo still handles the page interactions, but the user is taken to a full-screen edit page instead of an edit-in-place interaction.

### `--display-list-after-update` (default: false)

After an update-in-place normally only the edit view is swapped out for the show view of the record you just edited.

Sometimes you might want to redisplay the entire list after you make an update (for example, if your action removes that record from the result set).

To do this, use flag `--display_list_after_update`. The update will behave like delete and re-fetch all the records in the result and tell Turbo to swap out the entire list.





## Automatic Base Controller

HotGlue will copy a file named base_controller.rb to the same folder where it tries to create any controller, unless such a file exists there already.

Obviously, the created controller will always have this base controller as its subclass. In this way, you are encouraged to implement functionality common to the *namespace* (shared between the controllers in the namespace), using this technique.

## Field Types Supported

- Integers that don't end with `_id`: displayed as input fields with type="number"
- Integers that do end with `_id` will be treated automatically as associations. You should have a Rails association defined. (Hot Glue will warn you if it can't find one.)
- String: displayed as small input box 
- Text: displayed as large textarea
- Float: displayed as input box
- Datetime: displayed as HTML5 datetime picker
- Date: displayed as HTML5 date picker
- Time: displayed as HTML5 time picker
- Boolean: displayed radio buttons yes/ no
- Enum - displayed as a drop-down list (defined the enum values on your model). For Rails 6 see https://jasonfleetwoodboldt.com/courses/stepping-up-rails/enumerated-types-in-rails-and-postgres/


# VERSION HISTORY




#### 2022-02-07 - v0.4.8 Optionalized Nested Parents
    - optinoalized nested parents. to use add `~` in front of any nested parameter you want to make optional
    
    - This is an advanced feature is to use two duplicitous routes to the same controller.  You can only use this feature with Gd controller.  To use, specify your controller *twice* in your routes.rb. Then, in your `--nest` setting, add `~` to any nested parent you want to **make optional**. "Make optional" means the controller will behave as-if it exists in two places: once, at the normal nest level.  Then the same controller will 'exist' again one-level up in your routes. **If the route has sub-routes, you'll need to re-specify the entire subtree also**.
```
namespace :admin
  resources :users do
    resources :invoices
  end
  resoures :invoices
end
```
We will  build the scaffolding once for users and once again for invoice. Even though we have two routes pointed to invoices,
```
rails generate hot_glue:scaffold User --namespace=admin --gd --downnest=invoices
rails generate hot_glue:scaffold Invoice --namespace=admin --gd --nest=~users
```
    - Notice for the Invoice build, the parent user is *optionalized* (not 'optional'-- optionalized: to be made so it can be made optional).  The Invoices controller, which is a Gd controller, will load the User if a user is specified in the route (`/admin/users/:user_id/invoices/`). It will ALSO work at `/admin/invoices` and will switch back into loading directly from the base class when routed this way.
    - fixes to specified grouping mode-- the columns you specify now grab up the remaining bootstrap columns to fill space

#### 2022-01-26 - v0.4.7 `--nest` has been renamed to `--nested`; please use `--nested` moving forward
  - `--alt-controller-name` feature from the last release has been removed, I have something better coming soon
  - significant improvements to how child portals are handled, including setting the owner (parent) object when creating new records from a child portal
  - improvements to how 'self-auth' is handled, i.e., when a controller is built using an authentication identifier (e.g. `current_user`) that is the same as the controller's object
  - note that when building a self-auth controller, the list view still behaves as-if it is a list but controller only has access to the auth object (e.g. `current_user`). You would really only need this for the edge case of a user updating their own record, or, as in the example, to use as the starting point for building the child portals.  
  - another edge case in here that has been fixed involved creating a 'no field' form-- in the example, invoices are created using the "new" button and "save" button, even though the form has no editable fields for the user to input. In these edge cases, an invisible form field is inserted to make the form submission work correctly. This only happens for an action that has no inputable fields. 
  - cleaner code for the `_form` output and also the `controller` output 

#### 2022-01-23 - v0.4.6 -  `--no-list-labels` (flag; defaults false)
(additional features in this release have been subsequently removed)

#### 2022-01-11 - v0.4.5 - buttons on smart layouts take up 1 bootstrap column each; fixes confirmation alert for delete buttons

#### 2022-01-01 - v0.4.3 and 0.4.4 - adding fully email-based license, no activation codes required.

#### 2022-12-30 - v0.4.2 -- Smart layouts introduced

#### 2021-12-15 - v0.4.1

#### 2021-12-12 - v0.4.0

#### 2021-12-12 - v0.3.9 - Magic Buttons

#### 2021-12-11 - v0.3.5 - Downnesting


#### 2021-11-27 - v0.2.9E   (experimental)
                     - Downnesting
                     - Adds spec coverage support for enums
                     - Several more fixes; this is preparation for forthcoming release.
                     - Some parts still experimental. Use with caution. 

#### 2021-10-11 - v0.2.6 - many additional automatic fixes for default Rails installation 6 or 7 for the generate hot_glue:install command

#### 2021-10-10 - v0.2.5 - this version is all about developer happyness:
                            - significant fixes for the behavioral (system) specs. they now create new & update interactions
                            for (almost) all field types
                            - the install generator now checks your layouts/application.html.erb for `render partial: 'layouts/flash_messages' ` and adds it if it isn't there already
                            - the install generator also checks your spec/rails_helper for `config.include FactoryBot::Syntax::Methods` and adds it at the top of the Rspec configure block if it isn't there

#### 2021-10-07 - v0.2.4 - removes erroneous icons display in delete buttos (these don't work inside of button_to);
                            - adds support for ENUM types direclty on your field types
                            - you  must use activerecord-pgenum
                            - see my blog post at https://jasonfleetwoodboldt.com/courses/stepping-up-rails/enumerated-types-in-rails-and-postgres/

#### 2021-09-30 - v0.2.3 - fixes ERB output for show-only fields; fixes flash_notices for erb or haml; adds @stimulus_syntax flag for delete confirmations with stimulus

#### 2021-09-27 - v0.2.2 - Fixes some issues with related fields; unlocks Rails 7 in Gemspec file

#### 2021-09-20 - v0.2.1 - Fixes nesting behavior when using gd option

#### 2021-09-06 - v0.2.0 - ERB or HAML; use the option --markup=erb or --markup=haml (default is now erb)

#### 2021-06-28 - v0.1.2 - fixes problem with namespaces on path helpers

#### 2021-05-09 (yanked) - v0.1.1 -  add cancellation buttons

#### 2021-04-28 - v0.1.0 - Very pleased to introduce full behavior specs, found in specs/system/, generated by default on all build code; also many fixes involving nesting and authentication"

#### 2021-03-24 - v0.0.9 - fixes in the automatic field label detection; cleans up junk in spec output

#### 2021-03-21 - v0.0.8 - show only flag; more specific spec coverage in generator spec

#### 2021-03-20 - v0.0.7 - adds lots of spec coverage; cleans up generated cruft code on each run;  adds no-delete, no-create; a working --big-edit with basic data-turbo false to disable inline editing

#### 2021-03-06 - v0.0.6 - internal specs test the error catches and cover basic code generation (dummy testing only)

#### 2021-03-01 - v0.0.5 - Validation magic; refactors the options to the correct Rails::Generators syntax

#### 2021-02-27 - v0.0.3 - several fixes for namespaces; adds pagination; adds exclude list to fields

#### 2021-02-25 - v0.0.2 - bootstrapy

#### 2021-02-24 - v0.0.1 - first proof of concept release -- basic CRUD works



# HOW THIS GEM IS TESTED

SETUP:
• Run bundle install
• if you can't get through see https://stackoverflow.com/questions/68050807/gem-install-mimemagic-v-0-3-10-fails-to-install-on-big-sur/68170982#68170982


The dummy sandbox is found at `spec/dummy`

The dummy sandbox lives as mostly checked- into the repository, **except** the folders where the generated code goes (`spec/dummy/app/views/`, `spec/dummy/app/controllers/`, `spec/dummy/specs/` are excluded from Git)

When you run the **internal specs**, which you can do **at the root of this repo** using the command `rspec`, a set of specs will run to assert the generators are erroring when they are supposed to and producing code when they are supposed to.

The DUMMY testing DOES NOT test the actual functionality of the output code (it just tests the functionality of the generation process).


# DATABASE
being able to run `rake spec` at the root of this repo is achieved using
```
ln -s  spec/dummy/db/schema.rb db/schema.rb
```

 

Run rspec as
``` 
rake spec
```
Or with test coverage report:

```
COVERGE=on rake spec

```

--
--
 
Test coverage as of 2022-02-06
 
![Screen Shot 2022-02-06 at 10 26 36 PM](https://user-images.githubusercontent.com/59002/152719855-fdd3da6d-8348-44b9-8753-b0e73eee8065.png)


