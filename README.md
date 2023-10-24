# Service Bundle API Readme

## Overview

Service Bundle API is a Ruby on Rails application built on version 6, integrating JWT authentication and GraphQL to provide a flexible and secure backend for your service-oriented application. This README will guide you through the setup, usage, and customization of the Service Bundle API.

### Table of Contents
1. [Features](#features)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [Usage](#usage)
6. [Authentication](#authentication)
7. [GraphQL Queries and Mutations](#graphql-queries-and-mutations)
8. [Customization](#customization)
9. [Contributing](#contributing)
10. [License](#license)
11. [Front-End Repository](#front-end-repository)

## Features

- **Ruby on Rails 6**: Utilizes the latest features of Ruby on Rails for efficient and maintainable code.
- **JWT Authentication**: Provides secure authentication using JSON Web Tokens (JWT).
- **GraphQL**: Offers a flexible and efficient query language for your API, allowing you to request the data you need.
- **Modular Architecture**: Organized into services for improved maintainability and scalability.
- **User Management**: Ready-to-use user registration and authentication system.
- **Role-Based Access Control**: Implement role-based access control (RBAC) with the following roles:
    - **Admin**: Administrators have full access to system functionalities.
    - **User**: Regular users can interact with services, create carts, and make bookings.
    - **Provider**: Service providers manage services, time slots, and bookings.
- **Service Categories**: Organize services into categories for easy navigation.
- **Cart Management**: Users can create and manage carts, add items, and check out.
- **Payment Options**: Supports various payment options for a seamless checkout process.
- **Service Scheduling**: Providers can define time slots for their services, allowing users to book appointments.
- **Customizable**: Easily extend and customize to meet your application's specific needs.

## Requirements

Before setting up the Service Bundle API, ensure you have the following dependencies installed on your system:

- Ruby 2.6+
- Ruby on Rails 6
- PostgreSQL
- Bundler
- Node.js (for JavaScript runtime)

## Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/ron029/service_bundle_api.git
    ```

2. Navigate to the project directory:

    ```bash
    cd service_bundle_api
    ```

3. Install gem dependencies using Bundler:

    ```bash
    bundle install
    ```

4. Install JavaScript dependencies:

    ```bash
    yarn install
    ```

5. Create and migrate the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

6. Start the Rails server:

    ```bash
    rails server
    ```

Your Service Bundle API is now running and accessible at `http://localhost:3000/api/v1/graphql`.

## Configuration

- **Database Configuration**: You can configure your database settings in `config/database.yml`.
- **Environment Variables**: Customize your application using environment variables. Copy the `.env.example` file to `.env` and set the appropriate values.

## Usage

### Authentication

Service Bundle API uses JWT for authentication. To access protected resources, include the JWT token in the `Authorization` header of your requests. You can obtain a token by registering or logging in using the provided endpoints.

### GraphQL Queries and Mutations

Service Bundle API uses GraphQL as the query language. Access the GraphQL endpoint at `http://localhost:3000/api/v1/graphql` to interact with your data. Review the `app/graphql` directory to see available types and mutations. For documentation and queries, consider using GraphiQL or a similar tool.

### Customization

To customize the API, consider the following:

- **Models**: Create or modify models in the `app/models` directory.
- **Controllers**: Customize API behavior by creating or modifying controllers in the `app/controllers/api/v1/` directory.
- **GraphQL Types and Resolvers**: Extend or create GraphQL types and resolvers in the `app/graphql/types` and `app/graphql/resolvers` directories.
- **Routes**: Configure your routes in `config/routes.rb`.

## Contributing

We welcome contributions to the Service Bundle API. Please follow our [contribution guidelines](CONTRIBUTING.md) to contribute to the project.

## License

Service Bundle API is open-source and licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Front-End Repository

If you are looking for the front-end code that complements this API, you can find it in the following repository:

[Service Bundle Front-End Repository](https://github.com/ron029/service_bundle_frontend)

Please visit the front-end repository for details on setting up and running the user interface that works seamlessly with this API.


---

Enjoy using the Service Bundle API for building your service-oriented application! If you have any questions or encounter issues, please open a GitHub issue or reach out to the maintainers.

*Happy coding!*
