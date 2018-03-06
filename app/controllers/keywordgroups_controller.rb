class KeywordgroupsController < ApplicationController
  before_action :set_keywordgroup, only: [:show, :edit, :update, :destroy]

  # GET /keywordgroups
  # GET /keywordgroups.json
  def index
    @keywordgroups = current_user.keywordgroups
  end

  # GET /keywordgroups/1
  # GET /keywordgroups/1.json
  def show
  end

  # GET /keywordgroups/new
  def new
    @keywordgroup = Keywordgroup.new
  end

  # GET /keywordgroups/1/edit
  def edit
    @keywords = Keyword.where(keywordgroup_id: @keywordgroup.id)
  end

  # POST /keywordgroups
  # POST /keywordgroups.json
  def create
    # if params[:action_info] == 'keyword'
    #   @keywordgroup = Keywordgroup.create!(user_id: current_user.id)
    #   @keyword = Keyword.new
    #   @keyword.keyword_name = params[:keyword_name]
    #   @keyword.keywordgroup_id = @keywordgroup.id
    #   # @keyword.keywordgroup_id = @keywordgroup.id
      
    #   if @keyword.save
    #     flash[:notice] = "Keyword was successfully created!"
    #     # redirect_back(fallback_location: root_path)
    #     redirect_to edit_keywordgroup_path @keywordgroup
    #   else
    #     flash[:error] = "Failed creating keyword."
    #     # redirect_back(fallback_location: root_path)
    #     redirect_to new_keywordgroup_path
    #   end
    # end

    # if params[:action_info] == 'recipient'
    #   @greeting = Greeting.new(keywordgroup_params)
    #   @greeting.recipient_name = params[:name]
    #   @greeting.email = params[:email]
    #   @greeting.cc_state = params[:cc_state]
    #   # @greeting.user_id = current_user.id
    #   @greeting.keywordgroup_id = @keywordgroup.id
      
    #   if @greeting.save
    #     flash[:notice] = "Recipient was successfully created!"
    #     redirect_back(fallback_location: root_path)
    #   else
    #     flash[:error] = "Failed creating recipient."
    #     redirect_back(fallback_location: root_path)
    #   end
    # end
    # @keywordgroup = Keywordgroup.new(keywordgroup_params)

    # respond_to do |format|
    #   if @keywordgroup.save
    #     format.html { redirect_to @keywordgroup, notice: 'Keywordgroup was successfully created.' }
    #     format.json { render :show, status: :created, location: @keywordgroup }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @keywordgroup.errors, status: :unprocessable_entity }
    #   end
    # end    
  end

  # PATCH/PUT /keywordgroups/1
  # PATCH/PUT /keywordgroups/1.json
  def update
    @keyword = Keyword.new
    @keyword.keyword_name = params[:keyword_name]
    @keyword.keywordgroup_id = @keywordgroup.id
    
    if @keyword.save
      flash[:notice] = 'New keyword was successfylly added.'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'New keyword creation was failed.'
      redirect_back(fallback_location: root_path)
    end

    # respond_to do |format|
    #   if @keywordgroup.update(keywordgroup_params)
    #     format.html { redirect_to @keywordgroup, notice: 'Keywordgroup was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @keywordgroup }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @keywordgroup.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /keywordgroups/1
  # DELETE /keywordgroups/1.json
  def destroy
    @keywordgroup.destroy
    @keywords = Keyword.where(keywordgroup_id: @keywordgroup.id)
    @keywords.each do |keyword|
      keyword.destroy
    end
    respond_to do |format|
      format.html { redirect_to keywordgroups_url, notice: 'Keywordgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keywordgroup
      @keywordgroup = Keywordgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keywordgroup_params
      params.fetch(:keywordgroup, {})
      # params.require(:request).permit(:keyword_name, :name, :email, :cc_state)
    end

end
