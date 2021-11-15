require 'rails_helper'

RSpec.describe 'the hikers index page' do
  it 'US:1 displays the hikers names' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/hikers"

    expect(page).to have_content(hiker.id)
    expect(page).to have_content(hiker.name)
    expect(page).to have_content(hiker.phone_num)
    expect(page).to have_content(hiker.on_mountain)
    expect(page).to have_content(hiker.created_at)
    expect(page).to_not have_content(adk_mountain)
  end
  it 'US:8 has a link to hiker index' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/hikers"

    click_link('Hikers')

    expect(current_path).to eq("/hikers")
  end
  it 'US:9 has a link to adk_mountain index' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/hikers"

    click_link('ADK Mountains')
    expect(current_path).to eq("/adk_mountains")
  end
  it 'US:18 can click link and edit hiker for each hiker on table' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)
    hiker1 = adk_mountain.hikers.create(name: 'Shelby', phone_num: 585, on_mountain: true)
    visit "/hikers"

    first('section').click_link('Edit')

    expect(current_path).to eq("/hikers/#{hiker.id}/edit")
  end

  it 'US:23 can click link and delete any hiker' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/hikers"

    click_link('Delete')

    expect(page).to_not have_content(hiker.id)
    expect(page).to_not have_content(hiker.name)
    expect(page).to_not have_content(hiker.phone_num)
    expect(page).to_not have_content(hiker.on_mountain)
    expect(page).to_not have_content(hiker.created_at)
  end
end
