class RitlyController < ApplicationController

	def index
		@ritly = Bitly.all
	end

	def create
		random = params[:random]
		new_ritly = params.require(:bitly).permit(:name, :random, :url)
		# if Bitly.where(random: new_ritly[:random]).exists?
			# new_ritly[:random] == ""
		ritly = Bitly.create(new_ritly)
		# new_url = SecureRandom.urlsafe_base64(ritly.random.length)
	# 	ritly.update(new_url: new_url)
	# end
		redirect_to "/ritly/#{ritly.random}"
	end

	def random
		random = params[:random]
		@ritly = Bitly.find_by_random(random)
		render :random
	end

	def delete
		id = params[:id]
		ritly = Bitly.find_by_id(id)
		Bitly.destroy(id)
		redirect_to '/ritly/show'
	end


	def new
		@ritly = Bitly.new
		@random = SecureRandom.urlsafe_base64(12)
	end

	def update
		id = params[:id]
		@ritly = Bitly.find(id)
		update_ritly = params.require(:bitly).permit(:name, :random, :url)
		@ritly.update_attributes(update_ritly)
		redirect_to '/ritly/show'

	end

	def edit
		id = params[:id]
		@ritly = Bitly.find_by_id(id)
		render :edit

	end

	def show
		@ritly = Bitly.all
		render :show
	end

	def go
		random = params[:random]
		@ritly = Bitly.find_by_random(random)
		redirect_to "http://#{@ritly.url}"
	end

	def go_preview
		random = params[:random]
		@ritly = Bitly.find_by_random(random)
		snap = WebSnap::Snapper.new('google.com', :format => 'png')
		render :preview
	end

end
