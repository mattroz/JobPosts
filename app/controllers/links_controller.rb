class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index, :show, :feed, :digest]
  # before_action :authorized_user, only: [:edit, :update, :destroy]
  # GET /links
  # GET /links.json
  
def feed
    @links = Link.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
end

def digest
    @links = Link.where(created_at: (Time.now.midnight - 1.week)..Time.now.midnight).order("updated_at desc, cached_votes_up desc")
    respond_to do |format|
      format.rss { render :layout => false }
    end
end

  
  def index
    # @links = Link.paginate(page: params[:page], per_page: 30).find(:all, :order => "extract (day from created_at) desc, cached_votes_up desc")
    # @date = 1.day.from_now(@links.first.created_at.to_date) + 9.5.hours rescue nil
    # respond_to do |format|
    # format.html
    # format.js
    # end
    # if request.post?
    #   begin
    #     Gibbon::API.new('60bb001679ec500e529f898a988c6d65-us3').lists.subscribe({:id => 'fed0a70d7c', :email => {:email => params[:email]}, :double_optin => false})
    #     rescue Gibbon::MailChimpError => e
    #   return redirect_to user_path, :flash => { error: e.message }
    #   end
    # end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.friendly.find(params[:id])
  if request.path != link_path(@link)
    redirect_to @link, status: :moved_permanently
  else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end
  end

  # GET /links/new
  def new
  # @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
    def authorized_user
    @link = current_user.links.friendly.find(params[:id])
    redirect_to links_path, notice: "Not authorized to edit this link" if @link.nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end

    def email_params
      params.permit(:email)
    end
end
