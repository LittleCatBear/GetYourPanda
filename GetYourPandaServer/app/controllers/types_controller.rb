class TypesController < ApplicationController

	def index
		@types = Type.all
	#	render json: @types
	end
	def show
		@type = Type.find(params[:id])
		respond_to do |format|
			format.html
			format.json{
				render json: @type
			}
		end
	end

	def new
		@type = Type.new
	end

	def edit
		@type = Type.find(params[:id])
	end

	def create
		@type = Type.new(type_params)
		if @type.save
			redirect_to @type
		else 
			render "new"
		end
	end

	def update
		@type = Type.find(params[:id])

		if @type.update(type_params)
			redirect_to @type
		else
			render "edit"
		end
	end

	def destroy
		@type = Type.find(params[:id])
		@type.destroy
		redirect_to types_path
	end

	private
		def type_params
			params.require(:type).permit(:name)
		end

end
