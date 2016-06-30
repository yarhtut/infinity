require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validation' do
    it 'require a title' do
      @project = build(:project, title: nil)
      @project.valid?
      expect(@project.errors[:title]).to include "can't be blank"
    end

    it 'require a description' do
      @project = build(:project, description: nil)
      @project.valid?
      expect(@project.errors[:description]).to include "can't be blank"
    end
  end
end
