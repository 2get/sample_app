require 'spec_helper'

describe "MicropostPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe 'micropost creation' do
    before { visit root_path }

    describe 'with invalid information' do

      it 'should not create a micropost' do
        expect { click_button 'Post' }.should_not change(Micropost, :count)
      end

      describe 'error messages' do
        before { click_button 'Post' }
        it { should have_content('error') }
      end
    end

    describe 'with valid information' do

      it { should_not have_content('delete') }

      before { fill_in 'micropost_content', with: 'Lorem ipsum' }
      it 'should create a micropost' do
        expect { click_button 'Post' }.should change(Micropost, :count).by(1)
      end
      it { should have_selector('a', content: 'delete') }
      it { should have_selector('span', content: '1 micropost') }
    end
  end

  describe 'micropost destruction' do
    before { FactoryGirl.create(:micropost, user: user) }

    describe 'as correct user' do
      before { visit root_path }

      it 'should delete a micropost' do
        expect { click_link 'delete' }.should change(Micropost, :count).by(-1)
      end
    end
  end
end
