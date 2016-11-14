class UsersController < ApplicationController
  def index
    @users = User.all
    @relationships = Relationship.all
  end
end
