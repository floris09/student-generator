# Student Matcher

Ruby Application for matching students in pairs.

**Features:**
- Admins can create new pairs for any date
- Admins see pairs from the past, from today and upcoming pairs.
- Admins can demote or promote other users to student/admin.
- Every student will get matched with someone else every day, until he/she has been paired with everyone.
- Students can see their partner of today and their partners before today.
- Bouncing heads.

<img src="https://github.com/floris09/student-generator/blob/master/app/assets/images/Screen%20Shot%202017-12-04%20at%2009.58.53.png" alt="studentmatcher" width="400" height="280" border="10" position="relative" align="left"/>
<img src="https://github.com/floris09/student-generator/blob/master/app/assets/images/Screen%20Shot%202017-12-04%20at%2009.59.52.png" alt="studentmatcher" width="400" height="280" border="10" position="relative" align="left"/>
<img src="https://github.com/floris09/student-generator/blob/master/app/assets/images/Screen%20Shot%202017-12-04%20at%2010.00.36.png" alt="studentmatcher" width="400" height="280" border="10" position="relative" align="left"/>
<img src="https://github.com/floris09/student-generator/blob/master/app/assets/images/Screen%20Shot%202017-12-04%20at%2010.16.21.png" alt="studentmatcher" width="400" height="280" border="10" position="relative" align="left"/>

## Database Structure

1. Users - created by [Devise](https://github.com/plataformatec/devise). We added:
  * admin: boolean
  * pair_id: integer
  * first_name: string
  * last_name: string
  
2. Pairs
  * combinations: string, array: true

3. Daypairs
  * date: date
  * pairs: text, array: true

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org/en/) and [Bundler](http://bundler.io/) installed.

```bash
git clone git@github.com:floris09/student-generator.git
cd student-generator
bundle install
rails db:create db:migrate db:seed
rails server
```

## Test Suite

The following gems were used for testing:
  * [RSpec](http://rspec.info/) as the main testing library
  * [Capybara](http://teamcapybara.github.io/capybara/) to simulate how the user interacts
  * [Factory Girl](http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md) to generate model instances for testing
  * [Faker](https://github.com/stympy/faker) to generate fake data for testing
  * [Selenium Webdriver](http://www.seleniumhq.org/) to automate the browser
  * [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/) to communicate with the browser
