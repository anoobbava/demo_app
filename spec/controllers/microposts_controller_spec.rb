require 'spec_helper'
require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  before(:all) do
    @post = FactoryGirl.create(:micro2)
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

  it 'creates create micropost' do
    post_params = FactoryGirl.attributes_for(:micro2)
    expect { post :create, micropost: post_params }.to change(Micropost, :count).by(1)
  end

  it 'should show micropost' do
    get :show, id: @post
    expect(response.status).to render_template('show')
  end

  it 'should have edit access' do
    get :edit , id: @post
    expect(response.status).to render_template('edit')
  end

  it 'should cause error in create' do
    post_params = FactoryGirl.attributes_for(:micro_error)
    post :create, micropost: post_params
    expect(response.status).to render_template('new')
  end

  it 'update the micropost' do
    update_params = FactoryGirl.attributes_for(:micro2)
    put :update, id: @post.id , micropost: update_params
    expect(response).to redirect_to(@post)
  end

  it 'destroy the micropost' do
    expect { delete :destroy, id: @post }.to change(Micropost, :count).by(-1)
  end
end
