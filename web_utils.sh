#!/usr/bin/env bash

# create new rails app
rails_new() {
    if [ -z "$1"  ]; then
        echo "Please specify an application name";
    else
        echo "Creating a new rails application";
        rails new $1 && cd $1 && vim
    fi
}

# procedures for new rails api proj
api() {
    rails-api new $1 -S -d=postgresql -J --skip-turbolinks -T;
    cd $1;
    echo "Refer here -> https://github.com/rails-api/rails-api#for-new-apps";
    vim config/environments/{development,test}.rb;
}

# rails api project
rails_api_new() {
    echo "Creating a new API-only Rails application";

    if [ -z "$1"  ]; then
        echo "Please specify an application name";
    else
        # check for local rails-api gem
        if `gem list -i rails-api`; then
            api $1;
        else
            gem install rails-api;
            api $1;
        fi
    fi

}
