class ImagesController < ApplicationController

  # GET /images/1
  # GET /images/1.json
  def show
    image = Image.find_by_key(params[:id])
    render :text => image.data
  rescue => e
    render :status => 400, :json => { :message => e.message, :backtrace => e.backtrace }
  end


  # POST /images
  # POST /images.json
  def create
    imagedata = params[:imagedata]
    data      = imagedata.read
    key       = Digest::MD5.hexdigest(data + Time.now.to_s)

    image = Image.new(:data => data, :key =>key)
    image.save
    render :text => image.key
  rescue => e
    render :status => 400, :json => { :message => e.message, :backtrace => e.backtrace }
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    image  = Image.find_by_key(params[:id])
    result = image.destroy
    
    render :nothing => true
  rescue => e
    render :status => 400, :json => { :message => e.message, :backtrace => e.backtrace }
  end
end
