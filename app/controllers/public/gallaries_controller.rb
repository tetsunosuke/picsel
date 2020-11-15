class Public::GallariesController < ApplicationController
    def index
        @gallary = Gallary.new
        @gallaries = Gallary.all
    end
    def create
        @gallary = Gallarye.new(gallary_params)
        if @gallary.save
          redirect_to public_gallary_path
        else
          @gallaries = Gellary.where.(gallary_id:@ogallary.id)
          render "index"
        end
      end
end
