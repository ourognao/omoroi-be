class EventsController < ApplicationController
  before_action :set_event,   only: [:update, :destroy]
  
  def index
    @staff = User.staff
    if params[:screen] == 'top'
      get_top_screen_events 
      return
    end
    get_event_screen_events
  end
  
  def show
  end
  
  def update
    set_geo_localization
    @event.update(event_params)
  end

  def destroy
  end

  def create
    @event = Event.new(event_params)
    set_geo_localization
    @event.save!
    params[:event][:picture_ids].each do |qquuid|
      EventPicture.find_by(qquuid: qquuid).update(event_id: @event.id)
    end
  end

  private

  def set_geo_localization
    positions = params[:event][:positions]
    @event.location_jp = Geocoder.search(positions, language: :jp).first.data['display_name']
    @event.location_en = Geocoder.search(positions, language: :en).first.data['display_name']
  end

  def event_params
    params.require(:event).permit(
      :id,
      :user_id,
      :title,
      :date,
      :location_jp,
      :location_en,
      :access_jp,
      :access_en,
      :start_time,
      :end_time,
      :cost,
      :capacity,
      :threshold,
      :explanation_jp,
      :explanation_en,
      :picture_ids => [],
      :positions => [],
      :tags => [],
      :section => []
    )
  end

  def set_event
    @event = Event.find(params[:id]) if params[:id].present?
  end

  def get_top_screen_events
    startMonth  = Date.parse(changeDateFormat(params[:bom]))
    endMonth    = Date.parse(changeDateFormat(params[:eom])).end_of_month
    currentDay  = Time.current.strftime('%Y-%m-%d')

    @events     = Event.where('date BETWEEN ? AND ?', startMonth, endMonth).sortedByAsc
    @events    += Event.where('date < ?', currentDay).sortedByDesc.first(25)
  end

  def get_event_screen_events
    currentDay  = Time.current.strftime('%Y-%m-%d')
    if  params[:direction].nil?
      @events = Event.where("date >= ?", currentDay).sortedByAsc.page(params[:page])
    else
      @events = Event.where("date < ?", currentDay).sortedByDesc.page(params[:page])
    end
    @totalPages = @events.total_pages
  end

  def changeDateFormat(date)
    return date.gsub('-', '/')
  end
end
