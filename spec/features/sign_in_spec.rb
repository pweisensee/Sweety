require 'rails_helper'

describe 'Sign a user in' do

  it 'should see home page' do
    visit(root_path)
    expect(page).to have_current_path(root_path)
  end

  it 'should not see readings until signed in' do
    visit(readings_path)
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'should not see reports until signed in' do
    visit(reports_path)
    expect(page).to have_current_path(new_user_session_path)
  end
end