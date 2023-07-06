# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

This project was built upon from a Lighthouse Labs project foundation to practice using MVC workflow with Ruby on Rails.

A user can add items that are in stock to their cart, checkout with Stripe, and then see order details after payment has processed. Admin users can login to the dashboard where they can product categories or products themselves using the forms.

## Screenshots

![Jungle homepage](docs/jungle-homepage.png)
![Jungle admin dashboard](docs/jungle-admin-dashboard.png)
![Jungle account registration page](docs/jungle-account-registration.png)
![Jungle item details page](docs/jungle-item-details.png)
![Jungle order confirmation page](docs/jungle-order-confirmation.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Visit http://localhost:3000 to view project

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
