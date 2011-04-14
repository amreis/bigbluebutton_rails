require "spec_helper"

describe BigbluebuttonRails::Generators::ViewsGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../../tmp", __FILE__)
  tests BigbluebuttonRails::Generators::ViewsGenerator

  before(:all) do
    prepare_destination
  end

  it "creates and revokes all files properly with no params" do
    run_generator
    assert_files
    run_generator %w(), :behavior => :revoke
    assert_files(false)
  end

  it "creates and revokes all files properly with scope param" do
    run_generator %w(webconference)
    assert_files(true, "webconference")
    run_generator %w(webconference), :behavior => :revoke
    assert_files(false, "webconference")

    run_generator %w(the_cake_is_a_lie)
    assert_files(true, "the_cake_is_a_lie")
    run_generator %w(the_cake_is_a_lie), :behavior => :revoke
    assert_files(false, "the_cake_is_a_lie")
  end

  def assert_files(assert_exists=true, scope="bigbluebutton")
    files = [
      "app/views/#{scope}/rooms/edit.html.erb",
      "app/views/#{scope}/rooms/_form.html.erb",
      "app/views/#{scope}/rooms/index.html.erb",
      "app/views/#{scope}/rooms/join_wait.html.erb",
      "app/views/#{scope}/rooms/new.html.erb",
      "app/views/#{scope}/rooms/show.html.erb",
      "app/views/#{scope}/servers/edit.html.erb",
      "app/views/#{scope}/servers/_form.html.erb",
      "app/views/#{scope}/servers/index.html.erb",
      "app/views/#{scope}/servers/new.html.erb",
      "app/views/#{scope}/servers/show.html.erb"
    ]
    if assert_exists
      files.each { |f| assert_file f }
    else
      files.each { |f| assert_no_file f }
    end
  end

end