class EventsController < ApplicationController
  before_action :set_event,   only: [:update, :destroy]
  before_action :set_events,  only: [:index]
  
  def index
  end
  
  def show
  end
  
  def update
  end

  def destroy
  end

  def create
    @event = Event.new(event_params)
    @event.save!
    params[:event][:picture_ids].each do |qquuid|
      EventPicture.find_by(qquuid: qquuid).update(event_id: @event.id)
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :id,
      :user_id,
      :title,
      :date,
      :location,
      :access,
      :start_time,
      :end_time,
      :cost,
      :capacity,
      :threshold,
      :explanation,
      :picture_ids => [],
      :positions => [],
      :tags => [],
      :section => []
    )
  end

  def set_event
    @event = Event.find(params[:id]) if params[:id].present?
  end

  def set_events
    startMonth  = Date.parse(changeDateFormat(params[:bom]))
    endMonth    = Date.parse(changeDateFormat(params[:eom])).end_of_month
    currentDay  = Time.current.strftime('%Y-%m-%d')
    
    @users      = User.all
    @events     = Event.where('date BETWEEN ? AND ?', startMonth, endMonth).sortedByAsc
    @events    += Event.where('date < ?', currentDay).sortedByDesc.first(3) if params[:screen] == 'top'
  end

  def changeDateFormat(date)
    return date.gsub('-', '/')
  end
end
