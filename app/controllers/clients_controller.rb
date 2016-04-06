class ClientsController < InheritedResources::Base

  before_action :find_client, except: [:index, :new, :create]

  def index
    @clients = Client.all
  end

  def show; end

  def edit; end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to clients_path
    else
      render 'new'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render 'edit'
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :name,
      :last_name,
      :identification,
      :phone,
      :email,
      :password
    )
  end

  def find_client
    @client = Client.find(params[:id])
  end

end

