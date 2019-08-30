 require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "Rationale", user_id: user.id, overtime_request: 2.5)
  end
  before do
    login_as(@user, :scope => :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    xit 'has a list of posts' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/first|second/)
    end

    it 'has a scope so users only see their posts' do
      other_user = FactoryGirl.create(:unauthorized_user)
      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    xit 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      fill_in 'post[overtime_request]', with: 4.5

      expect{ click_on "Save" }.to change(Post, :count).by(1)
    end

    xit 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[overtime_request]', with: 4.5
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      logout(:user)
      @test_user = User.create(first_name: "test", last_name: "user",
        email: "testuser@user.com", password: "password", password_confirmation: "password")
      login_as(@test_user, :scope => :user)
      @test_post = Post.create(date: Date.today, rationale: "asdfasdf", user_id: @test_user.id)
      @post = FactoryGirl.create(:post)
    end

    xit 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some edited rationale"
      click_on "Save"
      expect(page).to have_content("Some edited rationale")
    end

    xit 'cannot be edited by an unauthorized user' do
      logout(:user)
      unauthorized_user = FactoryGirl.create(:unauthorized_user)
      login_as(unauthorized_user, :scope => :user)

      visit edit_post_path(@test_post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do
    xit 'can be deleted' do
      @post = FactoryGirl.create(:post)
      @post.update(user_id: @user_id)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
end
