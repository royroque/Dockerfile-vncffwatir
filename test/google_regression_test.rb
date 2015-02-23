ENV['HEADLESS'] ||= "true"

require 'watir'
require 'rake'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(:color => true)
require 'headless'


class GoogleSearchTest < Minitest::Test
  attr_accessor :browser, :headless

  def setup
    @headless = Headless.new
    headless.start if ENV['HEADLESS'] == "true" 
    @browser = Watir::Browser.new(:ff)
  end

  def teardown
    browser.close
    headless.destroy if ENV['HEADLESS'] == "true"
  end

  def test_1
    browser.goto('http://google.com')
    browser.text_field(:id => 'gbqfq').when_present.set 'watir'
    browser.button(:id => 'gbqfb').when_present.click
    assert browser.link(:text => /watir.com/i).when_present.exists?
  end

end
