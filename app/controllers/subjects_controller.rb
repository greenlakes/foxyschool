class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /subjects
  def index
    @pagy, @subjects = pagy(Subject.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @subjects
  end

  # GET /subjects/1 or /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new

    # Uncomment to authorize with Pundit
    # authorize @subject
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)

    # Uncomment to authorize with Pundit
    # authorize @subject

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, status: :see_other, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @subject
  rescue ActiveRecord::RecordNotFound
    redirect_to subjects_path
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:name)

    # Uncomment to use Pundit permitted attributes
    # params.require(:subject).permit(policy(@subject).permitted_attributes)
  end
end
