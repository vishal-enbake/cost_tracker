class UsersController < ApplicationController
  def index
    @projects = current_user.projects
  end
end
