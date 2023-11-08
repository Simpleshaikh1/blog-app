class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :find_user, only: [:show]

    def index
        # N+1 solution
        @users = User.includes(:posts).all
    end

    def show
        @user = User.find(params[:id])
    end
end
