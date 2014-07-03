class StaticPagesController < ApplicationController
  def home
    if current_user
      @projects = current_user.projects
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
