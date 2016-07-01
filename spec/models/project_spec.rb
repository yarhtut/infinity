require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validation' do
    let (:project) { build(:project, title: nil, description: nil) }

    it 'require a title' do
      project.valid?
      expect(project.errors[:title]).to include "can't be blank"
    end

    it 'require a description' do
      project.valid?
      expect(project.errors[:description]).to include "can't be blank"
    end
  end

  describe 'association' do
    it 'has many jobs' do
      @project = create(:project, :jobs)
      expect(@project.jobs).to eq Job.all
    end
  end
end
