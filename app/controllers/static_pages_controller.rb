class StaticPagesController < ApplicationController
  def home
  	@user = User.all
  end
  def perfomance_evaluation
  	
  end
end
