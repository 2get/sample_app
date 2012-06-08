class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js  # refactoring, Chapter 11 11.5 Exercises 2

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    responde_with @user
  end
end
