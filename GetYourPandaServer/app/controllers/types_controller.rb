class TypesController < ApplicationController

	def index
		@types = Type.all
	end
	def show
		@type = Type.find(params[:id])
	end

	def new
	end

	def create
		@type = Type.new(type_params)
		@type.save
		redirect_to @type
	end

	def destroy
		@type = Type.find(params[:id])
		@type.destroy
		redirect_to 
	end

	private
		def type_params
			params.require(:type).permit(:name)
		end

end
