require 'rails_helper'

RSpec.describe 'layouts/_header.html.erb', type: :view do
  before :each do
    @admin = FactoryGirl.create :admin_user
    sign_in @admin
  end

  it 'should show header information' do
    render
    expect(rendered).to have_link(@admin.email, href: admin_admin_user_path(@admin.id))
    expect(rendered).to have_link('logout', href: destroy_admin_user_session_path)
  end
end
