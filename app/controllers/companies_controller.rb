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
      current_user.nickname = @company.company_name
      current_user.save
      redirect_to company_path(@company), notice: 'Company created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @company = current_user.company
    redirect_to new_company_path, notice: 'You need to create a company first.' if @company.nil?
  end

  def update
    @company = current_user.company
    if @company.user == current_user
      if @company.update(company_params)
        redirect_to company_path(@company)
      else
        render :edit
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])

    if @company.user == current_user
      @company.user.destroy
      redirect_to root_path, notice: 'Perfil deletado com sucesso!'
    else
      redirect_to root_path, alert: 'Você não tem permissão para excluir esta empresa.'
    end
  end

  private

  def company_params
    params.require(:company).permit(:cnpj, :company_name, :photo)
  end
end
