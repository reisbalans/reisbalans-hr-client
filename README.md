# [Reisbalans](htps://www.reisbalans.nl) HR API Ruby Client

Ruby client for the Reisbalans HR JSON API. Authenticates via OAuth. To get your own Oauth keys, contact Reisbalans.

For more information on what the API looks like see the API docs: http://mijn.reisbalans.nl/api-doc/hr/
(You need to be logged in to the organization admin to view the documentation)

## Setup

Add `reisbalans-client-hr` to your Gemfile and run `bundle install`.

## Configurations

`ReisbalansHR.client` accepts the following configurations:

- `base_url`: 'http://mijn.reisbalans.nl'
- `client_id`: 'client123'
- `client_secret`: 'secret456'

## Resources and actions

This client implements the following resources:

- employees
    - index
    - show
    - create
    - update
- organization_intermediate_settlements
    - index
    - show
- employee_intermediate_settlements
    - show

## Gem development

```bash
git clone git@github.com:reisbalans/reisbalans-hr-client.git
cd reisbalans-hr-client
bundle install
bundle exec rspec
```
