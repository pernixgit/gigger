class ReviewsController <ApplicationController
  before_action :find_musician , only:[:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @review.reviews.build(review_params)
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def find_musician
    @musician = Musician.find(params[:musician_id])
  end
end
