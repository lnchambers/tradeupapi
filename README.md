# TradeUP API Documentation

The backend API for TradeUP, a website dedicated to building long term connections between trade schools and employers.

# Prerequisites

There are currently no prerequisites for this API. Documentation will be updated if that changes.

# Endpoints

* GET `https://arcane-woodland-66839.herokuapp.com/api/v1/locations`

  - Returns a list of locations of trade schools currently in the system.

* GET `https://arcane-woodland-66839.herokuapp.com/api/v1/schools`

  - Returns all trade schools currently in the system
  - Sort by location using the parameters. For example, sending a GET request to `api/v1/schools?location=Denver` will return all locations located in Denver

* GET `https://arcane-woodland-66839.herokuapp.com/api/v1/schools/<school_id>`

  - Returns a single trade school based off of the ID.

* POST `https://arcane-woodland-66839.herokuapp.com/api/v1/schools`

  - Creates a school in the database

# Concerns

- This API is in development. The documentation will be updated as development continues
- The API is currently hosted on a server that times out after a certain period of inactivity. If a call made to this API is taking a while, give it a minute. The server will catch up to you and further requests made in active server mode will be much quicker
