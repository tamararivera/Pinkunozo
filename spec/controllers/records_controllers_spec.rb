require 'spec_helper'

describe RecordsController do

  before do
    SessionsHelper.sign_in FactoryGirl.create(:user)
  end

  describe '#create' do

    let(:project) { FactoryGirl.build(:project) }
    let(:record) { FactoryGirl.attributes_for(:record) }

    before { project.save }

    it 'assigns and store the record topics' do
      post :create, project_id: project.id, record: record
      expect(response.status).to be(200)
    end
  end
end
