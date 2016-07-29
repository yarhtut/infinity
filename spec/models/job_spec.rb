require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validation' do
    let (:job){ build(:job, title: nil, description: nil, status: nil)}
    it 'require a title' do
      job.valid?
      expect(job.errors[:title]).to include "can't be blank"
    end
    it 'require a description' do
      job.valid?
      expect(job.errors[:description]).to include "can't be blank"
    end
    it 'require a status' do
      job.valid?
      expect(job.errors[:status]).to include "can't be blank"
    end
  end

  describe 'association' do
    it 'belongs to  project' do
      @job = build(:job, :project)
      expect(@job.project).to eq Project.first
    end
  end

  describe '.humanize_status' do
    before do
      @project = create(:project, :jobs)
      @job = Job.first
    end

    it 'returns started' do
      expect(@job.humanize_status).to eq 'started'
    end
  end
end
