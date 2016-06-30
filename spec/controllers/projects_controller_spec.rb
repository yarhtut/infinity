require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before do
    create_list(:project, 2)
  end

  describe '#index' do
    before do
      get :index
    end
    it 'render the index template' do
      expect(response).to render_template :index
    end
    it 'assigns all projects to @projects' do
      expect(assigns(:projects)).to eq Project.all
    end
  end
end
