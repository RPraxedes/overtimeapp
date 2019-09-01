require 'rails_helper'

describe 'Homepage' do
  it 'allows the admin to approve posts' do
    post = FactoryGirl.create(:post)
    admin_user = FactoryGirl.create(:admin_user)
    user = FactoryGirl.create(:user)

    login_as(admin_user, :scope => :user)
    visit root_path

    click_on "approve_#{post.id}"

    expect(post.reload.status).to eq('approved')
  end

  it 'allows the employee to change the audit log status from the homepage' do
    user = FactoryGirl.create(:user)
    audit_log = FactoryGirl.create(:audit_log)
    login_as(admin_user, :scope => :user)
    audit_log.update(user_id: user.id)
    visit root_path
    click_on("confirm_#{audit_log.id}")

    expect(audit_log.reload.status).to eq('confirmed')
end
