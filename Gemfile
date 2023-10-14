source "https://rubygems.org"

gem "puma"
gem "sinatra"
gem "sinatra-contrib"
gem "better_errors"
gem "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')
