class CandidatePolicy < ApplicationPolicy
  # ele vem puxando do aplication policy portanto travando todas as action
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

  end
  # def show?
  #   is_company?
  #   # ele vai puxar a respota true or false do is_company
  # end








  # private
  #   def is_company?
  #     if user.is_company == true
  #       true
  #     else
  #       false
  #   end

    # user.is_company
end
