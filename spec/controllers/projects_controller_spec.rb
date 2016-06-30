require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before do
    create_list(:project, 2)
  end
  
  describe '#index' do
    it 'render the index template' do
      get :index
      expect(response).to render_template :index
    end
    it 'assigns all projects to @projects' do
      get :index
      expect(assigns(:projects)).to eq Project.all
    end
  end
end
