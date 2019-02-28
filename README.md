Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# Database validations
## Contests table
Type is either:
- league (ie. championship)
- cup (knock-out system)
Status is either:
- opened (default) // gamblers can join the contest
- closed // gamblers cannot join the contest anymore. Games start.
- finished // contest is finished

## Games table
Status is either:
- pending (player_one_id.empty? && player_two_id.empty?)
- coming (Time.now < start_time)
- ongoing (start_time < Time.now < end_time)
- finished (Time.now > end_time)
- closed (score has been filled)

## Bet_form partial view
To create a bet form (both Game and Event), we should render the shared/bet_form partial view as:
```html
  <%= render 'shared/bet_form', locals: {
    value: 1, # or value: 2
    resource_type: 'Game', # or 'Event'
    resource_id: game.id # or 'event.id'
  } %>
```
