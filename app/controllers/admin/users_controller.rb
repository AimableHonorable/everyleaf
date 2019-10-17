class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:create, :show, :edit, :delete]
end
