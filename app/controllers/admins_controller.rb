class AdminsController < ApplicationController
    http_basic_authentication_with name: "vaibhav", password: "vaibhav123"
end
