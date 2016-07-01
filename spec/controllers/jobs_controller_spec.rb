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
end
