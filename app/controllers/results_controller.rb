class ResultsController < ApplicationController
  def index

    render("results/index.html.erb")
  end

  def show
    @results = Result.find(params[:id])

    render("results/show.html.erb")
  end

  def new
    @results = Result.new

    render("results/new.html.erb")
  end

  def create
    @results = Result.new

    @results.user_id = params[:user_id]
    @results.budtender_id = params[:budtender_id]

    save_status = @results.save

    if save_status == true
      redirect_to("/results/#{@results.id}", :notice => "Result created successfully.")
    else
      render("results/new.html.erb")
    end
  end

  def edit
    @results = Result.find(params[:id])

    render("results/edit.html.erb")
  end

  def update
    @results = Result.find(params[:id])

    @results.user_id = params[:user_id]
    @results.budtender_id = params[:budtender_id]

    save_status = @results.save

    if save_status == true
      redirect_to("/results/#{@results.id}", :notice => "Product recommendation updated successfully.")
    else
      render("results/edit.html.erb")
    end
  end

  def destroy
    @results = Result.find(params[:id])

    @results.destroy

    if URI(request.referer).path == "/results/#{@results.id}"
      redirect_to("/", :notice => "Result deleted.")
    else
      redirect_to(:back, :notice => "Result deleted.")
    end
  end
end
