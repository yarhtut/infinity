require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before do
    create_list(:project, 2)
  end

  describe 'GET #index' do
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

  describe 'GET #show' do
    it 'render the show template' do
      get :show, id: create(:project)
      expect(response).to render_template :show
    end

    it 'assigns the correct project' do
      @project = create(:project)
      get :show, id: @project
      expect(assigns(:project)).to eq @project
    end
  end

  describe 'POST #create' do
    let(:project) { attributes_for(:project, job: create(:job).id) }

    context 'with valid params' do
      it 'saves new project in the database' do
        expect do
          post :create, project: attributes_for(:project,
                                                project_attributes: @projects)
        end.to change(Project, :count).by(1)
      end

      it 'redirects to project #show' do
        post :create, project: attributes_for(:project,
                                              project_attributes: @projects)
        expect(response).to redirect_to project_path(assigns[:project])
      end
    end

    context 'with invalid params' do
      it 'do not save new project in the database' do
      end
    end
  end
end
