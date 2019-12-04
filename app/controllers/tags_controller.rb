class TagsController < ApplicationController
    include TagsHelper

    def index
        @tags = Tag.all
    end

    def show
        @tag = Tag.find(params[:id])
    end
end
