require 'test_helper'
 require 'selenium-webdriver'
require 'rspec'
class InputControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

include RSpec::Expectations
test 'siltnium' do
  @driver = Selenium::WebDriver.for :firefox
  @base_url = 'http://localhost:3000'
  @driver.manage.timeouts.implicit_wait = 30
  @verification_errors = []
end
  it 'test_calc' do
    @driver.get(@base_url + '/input/index')
    @driver.find_element(:id, 'n').clear
    @driver.find_element(:id, 'n').send_keys '1 2 3 3 4 5 6 7 8 1 2 3 3 3 3 34 35 72 96 15 35 46 73'
    @driver.find_element(:name, 'commit').click
    verify { @driver.find_element(:xpath, '//*[@id="result"]').text.should ==  [[3,4,5,6,7,8], [3,34,35,72,96], [15,35,46,73], [1,2,3], [1,2,3]] }
  end

  test 'should get input' do
    get input_input_url
    assert_response :success
  end

  test 'should get answer' do
    get input_answer_url params: { n: '1 2 3 3 4 5 6 7 8 1 2 3 3 3 3 34 35 72 96 15 35 46 73' }
    assert_response :success
  end



  test  '1_posl' do
    get input_answer_url params: { n: '1 2 3 3 4 5 6 7 8 1 2 3 3 3 3 34 35 72 96 15 35 46 73'}
    assert_equal assigns[:posled], [[3,4,5,6,7,8], [3,34,35,72,96], [15,35,46,73], [1,2,3], [1,2,3]]
  end

  test  '2_posl' do
    get input_answer_url params: { n: '110 100 90 80 70 60 50 40 30 20 10 9 8 7 6 5 4 3 2 1'}
    assert_equal assigns[:posled], []
  end
end
