class ImagesController < ApplicationController
	def create
		@type = Type.find(params[:type_id])
		@image = @type.images.create(image_params)
		redirect_to type_path(@type)
	end

	def destroy
		@type = Type.find(params[:type_id])
		@image = @type.images.find(params[:id])
		@image.destroy
		redirect_to type_path(@type)
	end

#json utile pour le client
	def show
		@type = Type.find(params[:type_id])
		@image = @type.images.find(params[:id])
		render json: @image
	end

	private
		def image_params
			params.require(:image).permit(:url, :img)
		end
end
