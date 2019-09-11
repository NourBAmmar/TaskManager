class RecherchesController < ApplicationController


	def new
		@recherche = Recherche.new
		#@categories = task.uniq.pluck(:domain)

	end
	def create
		@recherche = Recherche.create(recherche_params)
		#redirect_to @task
	end
	
	def show
		@recherhce = Recherche.find(params[id])
	end

	private
	def  recherche_params
		params.require(:recherche).permit(:keywords,:category)	
	end
end
