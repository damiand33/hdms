class WorksheetsController < ApplicationController
  def index
    @worksheets = Worksheet.all
  end

  def new
    @worksheet = Worksheet.new
  end
end
