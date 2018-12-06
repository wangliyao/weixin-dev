class WelcomeController < ApplicationController
  def index
    render html: "<h1>hello</h1>"
  end
end
