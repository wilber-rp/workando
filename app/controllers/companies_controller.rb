class CompaniesController < ApplicationController

  def show
    if current_user.company.present?
      @company = current_user.company
    else
      @company = Company.find(params[:id])
    end  
  end

  def new
    @company = Company.new
  end

  def create
    @company = current_user.build_company(company_params)

    if @company.save
      redirect_to company_path, notice: "Company created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @company = current_user.company
    if @company.nil?
      redirect_to new_company_path, notice: "You need to create a company first."
    end
  end
  
  def update
    @company = current_user.company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy!
    @company = current_user.company.find(params[:id])
    @company.destroy
    redirect_to company_path
  end

  private

  def company_params
    params.require(:company).permit(:cnpj, :company_name)
  end
end
