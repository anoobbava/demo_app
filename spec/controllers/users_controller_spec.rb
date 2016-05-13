require 'spec_helper'
require 'rails_helper'
require 'pry'


RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user1)
  end

  it 'should get index' do
    get :index
    expect(response.status).to render_template('index')
  end

  it 'should get new response' do
    get :new
    expect(response.status).to eq (200)
  end

  it 'should get new' do
    get :new
    expect(response).to render_template('new')
  end

  it 'creates create user' do
    post_params = FactoryGirl.attributes_for(:user1)
    expect { post :create, user: post_params }.to change(User, :count).by(1)
  end

  it 'should show micropost' do
    get :show, id: @user
    expect(response.status).to render_template('show')
  end

  it 'should have edit access' do
    get :edit , id: @user
    expect(response.status).to render_template('edit')
  end

  it 'should cause error in create' do
    post_params = FactoryGirl.attributes_for(:user_error)
    post :create, user: post_params
    expect(response.status).to render_template('new')
  end

  it 'update the user' do
    update_params = FactoryGirl.attributes_for(:user1)
    put :update, id: @user.id, user: update_params
    expect(response).to redirect_to(@user)
  end

  it 'update the user error' do
    update_params = FactoryGirl.attributes_for(:user_error)
    put :update, id: @user.id, user: update_params
    expect(response.status).to render_template('edit')
  end

  it 'destroy the micropost' do
    expect { delete :destroy, id: @user }.to change(User, :count).by(-1)
  end
end
