Rails.application.routes.draw do

  root 'schools#main'

  resources :schools
  get 'classrooms/index_by_school' => 'classrooms#index_by_school'
  resources :classrooms
  resources :teachers
  resources :teachers
  resources :students
end
