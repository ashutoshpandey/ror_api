module Api
    module V1
        class ArticlesController < ApplicationController
            def initialize()
                @article_service = ArticleService.new
            end

            def show
                result = @article_service.find(params[:id])
                message = result[:success] ? 'Record found' : 'Record not found'
                render json: { success: result[:success], message: message, data: result[:article] }, status: (result[:success] ? 200 : 404)
            end

            def create 
                result = @article_service.create(article_params)

                if result[:errors]
                    message = 'Error'
                    render json: { success: false, message: message, errors: result[:errors] }, status: 500
                else
                    message = result[:success] ? 'Record created' : 'Bad request'
                    render json: { success: result[:success], message: message, data: result[:article] }, status: (result[:success] ? 201 : 400)
                end
            end 

            def update 
                result = @article_service.update(params[:id], article_params)

                if result[:errors]
                    message = 'Error'
                    render json: { success: false, message: message, errors: result[:errors] }, status: 500
                else
                    message = result[:success] ? 'Record updated' : 'Not found'
                    render json: { success: result[:success], message: message, data: result[:article] }, status: (result[:success] ? 201 : 400)
                end
            end 

            def destroy
                result = @article_service.destroy(params[:id])

                if result[:errors]
                    message = 'Error'
                    render json: { success: false, message: message, errors: result[:errors] }, status: 500
                else
                    message = result[:success] ? 'Record deleted' : 'Not found'
                    render json: { success: result[:success], message: message }, status: (result[:success] ? 200 : 404)
                end
            end

            private

            def article_params
                params.require(:article).permit([:title, :body])
            end
        end
    end
end