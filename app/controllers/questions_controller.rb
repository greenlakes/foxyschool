class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy reveal]
  before_action :authenticate_user!, except: %i[index show reveal]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /questions
  def index
    @pagy, @questions = pagy(Question.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @questions
  end

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = Question.new
    return if current_user&.admin?

    redirect_to questions_path, notice: 'You have to be an admin to do that.'
    # Uncomment to authorize with Pundit
    # authorize @question
  end

  # GET /questions/1/edit
  def edit
    return if current_user&.admin?

    redirect_to questions_path, notice: 'You have to be an admin to do that.'
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    # Uncomment to authorize with Pundit
    # authorize @question

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, status: :see_other, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reveal; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @question
  rescue ActiveRecord::RecordNotFound
    redirect_to questions_path
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:body, :answer, :subject_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:question).permit(policy(@question).permitted_attributes)
  end
end
