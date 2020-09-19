require 'factory_bot'
require 'ffaker'

FactoryBot.define do
  factory :user do
    name { 'Sasha Gray' }
    email { 'Grey@example.com'}
    password { 'password' }
    password_confirmation { 'password' }
  end
end