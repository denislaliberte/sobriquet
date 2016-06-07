require 'test_helper'
require 'sobriquet'
include Sobriquet

class DataTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_add
    assert Sobriquet::add
  end
end
