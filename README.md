# ruby-on-rails-project-wonky
This is an online marketplace for farmers to list produce that is not accepted by supermarkets. Almost half of the produce grown is not accepted from farms across the world. Which is perfectly fine for consumption. This application should hopefully provide a channel for farmers to help alleviate waste.

Farmers can create an account/login, fill out farm details including organic certification and farm address, create listings with the value of the product.

Users can create an account/login with google authentication and normal email/password combination, fill out user profile including google profile picture and address, filter listings by category and distance, view listings and create purchases.

## Getting Started

Clone or download the repository to your local machine and after open your terminal on the repo and run:  

bundle install  
rake db:migrate  
rake db:seed

run 'rails s' in terminal to begin local hosting of Rails application.  

### Enviroment Variables
These are stored within the encrypted credentials.yml.enc file.
Please add:
Google map api key (google_api:)
Google authentication client-id and client-secret (google_auth_api_client_id: & google_auth_api_client_secret:)


## Built With

* [Rails](https://github.com/rails/rails) - Used for the web development framework  
* [bcrypt](https://github.com/codahale/bcrypt-ruby) - Used to provide password authenication
* [OmniAuth](https://github.com/omniauth/omniauth) - Used to provide 3rd party authentication  
* [geocoder](https://github.com/alexreisner/geocoder) - Used for location data API

## Versioning

This application uses Semantic Versioning.

## Authors

* **Danny Buckley** - *Initial work* - [Me](https://github.com/DBuckley0126)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


