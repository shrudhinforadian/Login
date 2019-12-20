# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authorize
  def index; end
end
