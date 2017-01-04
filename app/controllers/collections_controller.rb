class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]

  # GET /collection/1
  def show
    @media = @collection.media.order :created_at
  end

  def index
    @covers = {}
    @collections = Collection.where(published: true).order :position
    @collections.each do |collection|
      @covers[collection.id] =
        collection.media.references(:media_collections).where(media_collections: {cover: true})
    @media = Medium.all
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

end
