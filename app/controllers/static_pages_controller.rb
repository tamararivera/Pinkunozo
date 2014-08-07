class StaticPagesController < ApplicationController
  def home
    if current_user
      @projects = current_user.projects.order(:id).page(params[:page]).per(24)
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
