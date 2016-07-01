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

  describe 'GET #new' do
    before do
      get :new
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

    it 'assigns the new projects' do
      expect(assigns(:project)).to be_a(Project)
    end
  end

  describe 'PATCH #update' do
    before do
      @project = create(:project,
                        title: 'Rspec', description: 'we got 16 rspec yeah!!!')
    end

    context 'with valid attribute' do
      it 'locates the requested @project' do
        patch :update, id: @project, project: attributes_for(:project)
        expect(assigns(:project)).to eq(@project)
      end

      it 'updates the @project attribute' do
        patch :update, id: @project,
                       project: attributes_for(:project,
                                               title: 'Rspec Updated',
                                               description: '17 rspec!!')
        @project.reload
        expect(@project.title).to eq 'Rspec Updated'
        expect(@project.description).to eq '17 rspec!!'
      end

      it 'redirect to the show page' do
        patch :update, id: @project, project: attributes_for(:project)
        expect(response).to redirect_to project_path(@project)
      end
    end

    context 'with invalid attribues' do
      it 'will not update @project attribute' do
        patch :update, id: @project,
                       project: attributes_for(:project,
                                               title: 'Rspec Updated',
                                               description: nil)
        @project.reload
        expect(@project.title).to_not eq 'Rspec Updated'
        expect(@project.description).to_not eq '17 rspec!!'
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @project = create(:project)
    end

    it 'assigns the project' do
      delete :destroy, id: @project
      expect(assigns(:project)).to eq @project
    end

    it 'delete the project' do
      expect do
        delete :destroy, id: @project
      end.to change(Project, :count).by(-1)
    end

    it 'redirect to the index' do
      delete :destroy, id: @project
      expect(response).to redirect_to projects_path
    end
  end
end
