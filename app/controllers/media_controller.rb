class MediaController < ApplicationController
  include MediaHelper

  before_action :set_medium, only: [:show, :download]

  # GET /collection/1/medium/1
  def show
    media = @collection.media.order :created_at

    @prev_medium = media.where('created_at < ?', @medium.created_at).last
    @prev_medium = media.last if !@prev_medium

    @next_medium = media.where('created_at > ?', @medium.created_at).first
    @next_medium = media.first if !@next_medium

    @position = media.where('created_at < ?', @medium.created_at).count + 1
    @count = media.count

    @medium.description = @collection.description if !@medium.description
  end

  # GET /collection/1/medium/1/download
  def download
    send_file download_medium_path(@medium), :type=>"application/jpg", :x_sendfile=>true
  end

  private

  def set_medium
    @collection = Collection.find(params[:collection_id])
    @medium = Medium.find(params[:id])
  end

end
