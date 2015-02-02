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

	def random
		@type = Type.find(params[:type_id])
		#@images = @type.images.all
		c = @type.images.count
		@image = @type.images.offset(rand(c)).first
		#rend le chemin relatif de l'image
		render json: URI.join(request.url, @image.img.url)
	end

	private
		def image_params
			params.require(:image).permit(:url, :img)
		end
end
