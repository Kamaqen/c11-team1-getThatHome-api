# Ruby on Rails API README

This Ruby on Rails project serves as an API backend for the "Get That Home" React project. It provides endpoints for retrieving, creating, updating, and deleting data related to homes. The API utilizes Ruby on Rails version 7.1.3.2 and Ruby version 3.2.2p53.

## Installation

To run this project locally, follow these steps:

1. Clone the repository:

```bash
git clone <repository-url>
```

2. Navigate to the project directory:

```bash
cd <project-directory>
```

3. Install dependencies using Bundler:

```bash
bundle install
```

4. Set up the database:

```bash
rails db:create
rails db:migrate
```

5. Start the Rails server:

```bash
rails server
```

## API Endpoints

The following are the main API endpoints available in this project:

- **GET /api/homes**: Retrieve a list of all homes.
- **GET /api/homes/:id**: Retrieve details of a specific home by ID.
- **POST /api/homes**: Create a new home.
- **PUT /api/homes/:id**: Update details of a specific home by ID.
- **DELETE /api/homes/:id**: Delete a specific home by ID.

Replace `:id` with the ID of the home you want to retrieve, update, or delete.

## Dependencies

This project uses various gems for its functionality. Here are some of the main dependencies listed in the `Gemfile.lock`:

- `bcrypt` for password hashing.
- `factory_bot` and `factory_bot_rails` for testing purposes.
- `faker` for generating fake data.
- `pg` for PostgreSQL database.
- `puma` as the web server.
- `rack-cors` for enabling Cross-Origin Resource Sharing (CORS).
- `rails` as the Ruby on Rails framework.
- `rspec-rails` for RSpec testing.
- `rubocop` for code linting.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
