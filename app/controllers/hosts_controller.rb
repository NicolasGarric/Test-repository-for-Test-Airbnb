class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  def index
    @hosts = Host.all
  end

  def show; end

  def create
    @host = Host.new(host_params)
    if @host.save
      redirect_to @host, notice: 'Compte hôte créé avec succès.'
    else
      render 'new'
    end
  end

  private

  def set_host
    @host = Host.find(params[:id])
  end

  def host_params
    params.require(:host).permit(:name, :email, :password, :password_confirmation)
  end
end
