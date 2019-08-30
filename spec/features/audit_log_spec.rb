require 'rails_helper'

describe 'AuditLog Feature' do
  before do
    @audit_log = FactoryGirl.create(:audit_log)
  end

  describe 'index' do
    before do
      admin_user =  FactoryGirl.create(:admin_user)
      login_as(admin_user, :scope => :user)
      visit audit_logs_path
    end
    it 'has a reachable index' do
      expect(page.status_code).to eq(200)
    end

    it 'renders audit logs' do
      expect(page).to have_content(/SNOW, JON/)
    end

    xit 'cannot be accessed by non admin users' do

    end
  end
end
