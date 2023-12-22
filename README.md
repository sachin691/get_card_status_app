# README

# Card Status App ReadMe
Overview
This Card Status App is a Ruby on Rails application designed to provide an internal API for querying the status of user cards. The app integrates data from partner companies to deliver real-time card status information, supporting internal tracking and assisting agents in addressing user concerns.

## Approach
Language and Framework
Ruby on Rails was chosen for several reasons:

Rapid Development: Rails follows the convention over configuration (CoC) and don't repeat yourself (DRY) principles, enabling fast development with less boilerplate code.

Active Record: Rails' Active Record ORM simplifies database interactions and allows for easy modeling of data.

Community Support: Rails has a large and active community, providing a wealth of resources and plugins.

## Architecture
The application follows a standard MVC (Model-View-Controller) architecture:

Models: Represent entities like Pickup, DeliveryException, Delivered, and Returned.
Views: For rendering responses (mostly JSON in this case).
Controllers: Handle requests and orchestrate interactions between models and views.


## Possible Improvements
Error Handling: Implement more robust error handling for edge cases and unexpected scenarios.

Optimizations: Optimize database queries and overall application performance.

Enhanced Security: Implement secure coding practices, especially when handling user data.

Testing: Expand test coverage, including unit tests, integration tests, and edge case scenarios.

## License
This project is licensed under the MIT License.

Feel free to reach out with any questions or suggestions. Happy coding!
