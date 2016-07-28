require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attribute' do
      it 'will save in the database for job' do
        expect do
          post :create, job: attributes_for(:job,
                                            project_id: create(:project),
                                            job_attributes: @jobs)
        end.to change(Job, :count).by(1)
      end

      it 'redirects to project #show' do
        post :create, job: attributes_for(:job,
                                          project_id: create(:project))
        expect(response).to redirect_to project_path(assigns[:job])
      end
    end
  end

  describe 'PATCH #update' do
    before do
      @project = create(:project, :jobs)
      @job = Job.first
    end

    context 'with valid attribute' do
      it 'locates the requested @job' do
        patch :update, id: @job, job: attributes_for(:job)
        expect(assigns(:job)).to eq(@job)
      end

      it 'updates the @job attribute' do
        patch :update, id: @job, job: attributes_for(:job,
                                                      title: 'NetLib',
                                                      description: '17 rspec!!',
                                                      status: '1')
        @job.reload
        expect(@job.title).to eq 'NetLib'
        expect(@job.description).to eq '17 rspec!!'
        expect(@job.status).to eq 1
      end

      it 'redirect to the show page' do
        patch :update, id: @job, job: attributes_for(:job)
        expect(response).to redirect_to project_path(@project)
      end
    end

    context 'with invalid attribues' do
      it 'will not update @job attribute' do
        patch :update, id: @job,
                       job: attributes_for(:job,
                                               title: 'Rspec Updated',
                                               description: nil,
                                               status: nil)
        @job.reload
        expect(@job.title).to_not eq 'Rspec Updated'
        expect(@job.description).to_not eq '17 rspec!!'
        expect(@job.description).to_not eq '1'
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @project = create(:project, :jobs)
      @job = Job.first
    end

    it 'assigns the job' do
      delete :destroy, id: @job
      expect(assigns(:job)).to eq @job
    end

    it 'delete the job' do
      expect do
        delete :destroy, id: @job
      end.to change(Job, :count).by(-1)
    end

    it 'redirect to the index' do
      delete :destroy, id: @job
      expect(response).to redirect_to project_path
    end
  end
end
