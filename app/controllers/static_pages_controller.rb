class StaticPagesController < ApplicationController
  def home
    @projects = current_user.projects
  end

  def help
  end

  def about
  end
end
