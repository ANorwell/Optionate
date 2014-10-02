require_relative 'test_helper'

class ThenTest < Minitest::Should::TestCase
  context 'defined objects' do
    setup do
      @defined = 1
    end

    should 'invoke and return a provided block' do
      assert_equal 2, @defined.then { |x| x * 2 }
      assert_equal 2, @defined.then { 1 + 1 }
    end
  end

  context 'nil objects' do
    should 'invoke and return a provided block' do
      assert_equal 2, nil.then { |n| 1 + 1 }
      assert_equal 2, nil.then { 1 + 1 }
    end
  end
end
