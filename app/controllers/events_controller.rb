class EventsController < InheritedResources::Base

  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_event, except: [:index, :new, :create]

  def index
    @events = Event.all
  end

  def show; end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :date,
      :time,
      :description,
      :email,
      :phone,
      :event_type_id
    )
  end

  def find_event
    @event = Event.find(params[:id])
  end

end

