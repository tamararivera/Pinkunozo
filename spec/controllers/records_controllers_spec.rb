require 'spec_helper'

describe ActsController do

  before do
    SessionsHelper.sign_in FactoryGirl.create(:user)
  end

  describe '#create' do

    let(:project) { FactoryGirl.build(:project) }
    let(:act) { FactoryGirl.attributes_for(:act) }

    before { project.save }

    it 'assigns and store the record topics' do
      post :create, project_id: project.id, act: act
      expect(response.status).to be(200)
    end
  end
end
