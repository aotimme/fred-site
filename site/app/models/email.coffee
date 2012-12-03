App = require 'app'

DAYS_OF_WEEK = [
  'Sunday'
  'Monday'
  'Tuesday'
  'Wednesday'
  'Thursday'
  'Friday'
  'Saturday'
]

MONTHS = [
  'January'
  'February'
  'March'
  'April'
  'May'
  'June'
  'July'
  'August'
  'September'
  'October'
  'November'
  'December'
]

App.EmailModel = DS.Model.extend
  # attributes
  _id  : DS.attr 'string'
  title: DS.attr 'string'
  text : DS.attr 'string'
  date : DS.attr 'date'

  dateString: (->
    date    = new Date @get('date')
    day     = DAYS_OF_WEEK[date.getDay()]
    dayNum  = date.getDate()
    month   = MONTHS[date.getMonth()]
    year    = date.getFullYear()
    hours   = date.getHours()
    ampm    = if hours > 11 then 'PM' else 'AM'
    hours   = hours - 12 if hours > 12
    hours   = 12 if hours is 0
    minutes = date.getMinutes()
    minutes = if minutes < 10 then "0#{minutes}" else "#{minutes}"
    "#{day[0...3]}, #{month} #{dayNum}, #{year} - #{hours}:#{minutes} #{ampm}"
  ).property('date')

  didLoad: -> console.log "Loaded email:", @get('title')

.reopenClass
  url: 'email'
