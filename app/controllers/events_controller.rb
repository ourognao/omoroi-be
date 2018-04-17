class EventsController < ApplicationController
  before_action :set_events, only: [:index]
  
  def index
  end
  
  def show
  end
  
  def update
  end

  def destroy
  end

  private

  def set_events
    startMonth  = Date.parse(changeDateFormat(params[:bom]))
    endMonth    = Date.parse(changeDateFormat(params[:eom])).end_of_month
    currentDay  = Time.current.strftime('%Y-%m-%d')
    
    @users      = User.all
    @events     = Event.where('date BETWEEN ? AND ?', startMonth, endMonth).sortedByAsc
    @events    += Event.where('date < ?', currentDay).sortedByAsc.last(3) if params[:screen] == 'top'
  end

  def changeDateFormat(date)
    return date.gsub('-', '/')
  end
end
