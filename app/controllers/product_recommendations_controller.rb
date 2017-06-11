class ProductRecommendationsController < ApplicationController
  def index
    @product_recommendations = ProductRecommendation.all

    render("product_recommendations/index.html.erb")
  end

  def show
    @product_recommendation = ProductRecommendation.find(params[:id])

    render("product_recommendations/show.html.erb")
  end

  def new
    @product_recommendation = ProductRecommendation.new

    render("product_recommendations/new.html.erb")
  end

  def create
    @product_recommendation = ProductRecommendation.new

    @product_recommendation.user_id = params[:user_id]
    @product_recommendation.budtender_id = params[:budtender_id]

    save_status = @product_recommendation.save

    if save_status == true
      redirect_to("/product_recommendations/#{@product_recommendation.id}", :notice => "Product recommendation created successfully.")
    else
      render("product_recommendations/new.html.erb")
    end
  end

  def edit
    @product_recommendation = ProductRecommendation.find(params[:id])

    render("product_recommendations/edit.html.erb")
  end

  def update
    @product_recommendation = ProductRecommendation.find(params[:id])

    @product_recommendation.user_id = params[:user_id]
    @product_recommendation.budtender_id = params[:budtender_id]

    save_status = @product_recommendation.save

    if save_status == true
      redirect_to("/product_recommendations/#{@product_recommendation.id}", :notice => "Product recommendation updated successfully.")
    else
      render("product_recommendations/edit.html.erb")
    end
  end

  def destroy
    @product_recommendation = ProductRecommendation.find(params[:id])

    @product_recommendation.destroy

    if URI(request.referer).path == "/product_recommendations/#{@product_recommendation.id}"
      redirect_to("/", :notice => "Product recommendation deleted.")
    else
      redirect_to(:back, :notice => "Product recommendation deleted.")
    end
  end
end
