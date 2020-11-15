class Public::TagsController < ApplicationController
    def index
        @tag = Tag.find(params[:id])
    end
end
