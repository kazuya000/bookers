Rails.application.routes.draw do

 get '/' =>'books#top'

 get 'books/new'
 resources :books
 
 end
