class Article < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    Rails.application.routes.draw do
        resources :articles do
          resources :comments
          resources :show
        end
      end
      

   end