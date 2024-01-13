require "test_helper"

class FileModelTest < Minitest::Test

  def test_file_list
    files = LemonSqueezy::File.list

    assert_equal LemonSqueezy::Collection, files.class
    assert_equal LemonSqueezy::File, files.data.first.class
    assert_equal "TDX8EYkZ8K.png", files.data.first.name
  end

  def test_file_list_by_variant
    files = LemonSqueezy::File.list variant_id: 212481

    assert_equal LemonSqueezy::Collection, files.class
    assert_equal LemonSqueezy::File, files.data.first.class
    assert_equal "TDX8EYkZ8K.png", files.data.first.name
  end

  def test_file_retrieve
    file = LemonSqueezy::File.retrieve id: 124195

    assert_equal LemonSqueezy::File, file.class
    assert_equal "TDX8EYkZ8K.png", file.name
    assert_equal 7863, file.size
  end

end
