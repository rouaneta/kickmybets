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
- coming
- ongoing
- finished