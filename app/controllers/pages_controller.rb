class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  end

  def challenge_list
  end

  def policies
  end
end
