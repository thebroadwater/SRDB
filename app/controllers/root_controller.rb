class RootController < ApplicationController
  def index
  end

  def sitemap
    @people = Person.all
    respond_to do |format|
      format.xml
    end
  end
end
