# Schedule Ruby on Rails  

A API that allows users to create a schedule with appointments.

Schedules can be created, updated (by adding appointments), modified (only by removing appointments), or deleted. Appointment can belong only to 1 schedule, can be created or deleted, and cannot be modified. Appointments cannot overlap (e.g, first appointment starts at 12pm and ends at 3pm, so no other appointments can be created with start time between 12pm and 3pm within the same schedule). Built with [Ruby on Rails](https://rubyonrails.org/).

## Getting started
### Install Ruby on Rails and gems

* Check if Ruby and Rails are already installed  by running `ruby -v` and `rails -v` respectively
* If ruby version is not up to date, update it with `rbenv install X.X.X`, where `X.X.X` is the desired version (Ruby>= 2.2.2 and Rails 5+ is used for this project) and set is as global version with `rbenv global X.X.X` (if you don't have other  RoR projects sensitive to RoR version)
* Update rails if it is not up to date with `gem update rails`
* Install all  gems by running `bundle install`

### Run migrations
* Run migrations `rails db:migrate`

### Supported requests 
  - **GET** Returns infortmation about schedules and appointments for the provided schedule ID (for schedules) or schedule ID and appointment ID (for appointments :  
      - `http://localhost:3000/schedules`
      - `http://localhost:3000/schedules/1`
      - `http://localhost:3000/schedules/1/appointments`
      - `http://localhost:3000/schedules/1/appointments/1`
  - **POST** Creates a schedule or an appointments based upon the request body:
  
      supports requests (appointments) with JSON body in following format:
      
      ```"start_time":1, "end_time":3, "description":"some text"}```
      
      `start_time`, `end_time` are required, and cannot be non-integers
      
      `description` is optional and can be blank
      
      - `http://localhost:3000/schedules`
      - `http://localhost:3000/schedules/1/appointments`
  - **DELETE** Deletes the schedule or appointment with provided schedule ID (for schedules) or schedule ID and appointment ID (for appointments):
      - `http://localhost:3000/schedules/1`
      - `http://localhost:3000/schedules/1/appointments/1`
  
  ## Acknowledgements
   - [Ruby on Rails](https://rubyonrails.org/)
   - [Overlap](https://github.com/robinbortlik/validates_overlap)
