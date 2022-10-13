require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Games"
  # end
  test 'Going to /new gives us a new random grid to play with' do
    visit new_url
    assert test: 'New game'
    assert_selector 'p', count: 10
  end

  test 'User can fill the form with a random word, click the PLAY button, and get a NOT IN THE GRID message' do
    visit new_url
    fill_in 'answer', with: 'random'
    click_on 'Play'
    assert_text "Sorry, but random can't be built out of #{@letters}"
  end

  test 'User can fill the form with a one-letter consonant, click play, and get NOT A VALID ENGLISH WORD message' do
    visit new_url
    fill_in 'answer', with: 'r'
    click_on 'Play'
    assert_text "Sorry, but r does not seem to be a valid English word..."
  end

end
