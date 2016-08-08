class WorksheetsController < ApplicationController
  def index
    @worksheets = Worksheet.all
  end
end
