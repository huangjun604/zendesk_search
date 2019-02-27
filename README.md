# Zendesk Search

Zendesk Search is a command-line application to search the value from the provided data (users.json, tickets.json, organizations.json) and return the results.

## Environments

Requires `ruby >= 2.6.0`


## Installation

To install the application, cd to the root directory and invoke:

```
$ bundle install
```

## Usage

To run the application, invoke:

```
$ bundle exec exe/zendesk_search
```

And then press `Enter` to continue, you can type `quit` to exit at any time

```
Type 'quit' to exit at any time, Press 'Enter' to continue
```

After that, select the task you want to do:

```
Select search options
        * Press 1 to search Zendesk
        * Press 2 to view a list of searchable fields
        * Type 'quit' to exit
```

### Search Zendesk

When you select 1, it ask you to select the data type you want to search:

```
Select 1) Users or 2) Tickets 3) Organizations
```

After that, enter the search term, if your entered term is not valid

```
Enter search term
```

Finally, enter the search value for this term:

```
Enter search value
```

After that, the result will be displayed as a table.

### View a list of searchable fields

If you don't know what item can be searched, you can press 2 when you select the options. And the valid search items will be print out.

## Testing

To run the testing, invoke:

```
$ bundle exec rspec
```

## Design

### Extensibility

This project has multiple classes that do different things:

- Resource Class(i.e. `User`, `Organization`, `Ticket`)
- Collection Class(i.e. `Users`, `Organizations`, `Tickets`)
- Factory Class(i.e. `Printer`, `ResourceLoader`)

This project can be easily scaled with more data sources:

- Create resource class and extend `Base` class.
- Configure valid attributes and associations.
- Create collection class and extend `Collection` class.
- Add new resource name to `SEARCHABLE_RESOURCES` in the CLI class.

### Simplicity

Ensure the structure and methods are best practice wherever possible.

### Test Coverage

This project tests all the model, collection and factory classes.

### Performance

This project will only load the data once to the memory.

### Robustness

This project will check every user inputs. Inputs allows full term or prefix. For example: `external_id` and `exte` are both allowed in User search and will search the term `external_id`

If the input is invalid, it will show errors and prompt the valid inputs, for example:

```
> Select 1) User or 2) Organization or 3) Ticket
3
> Enter search term
company
> You must choose one of [_id, url, external_id, created_at, type, subject, description, priority, status, submitter_id, assignee_id, organization_id, tags, has_incidents, due_at, via].
?
```

## Copyright

Copyright © 2019 Stephen Huang
