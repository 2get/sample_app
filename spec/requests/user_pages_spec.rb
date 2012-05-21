require 'spec_helper'

  describe 'User pages' do
    subject { page }

  let(:sign_up_text) { 'Sign up' }

    describe 'signup page' do
      before { visit signup_path }

      it { should have_selector('h1', text: sign_up_text) }
      it { should have_selector('title', text: full_title(sign_up_text)) }
    end
  end

