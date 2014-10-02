require_relative 'test_helper'

class OrElseTest < Minitest::Should::TestCase

  context 'defined objects' do
    setup do
      @defined = 1
    end

    context 'invoked with a block' do
      context 'arity zero' do
        should 'return the same object' do
          assert_equal @defined, @defined.or_else { obj * 2 }
        end
      end

      context 'arity larger than zero' do
        should 'return the same object' do
          assert_equal @defined, @defined.or_else { |obj| obj * 2 }
        end
      end
    end

    context 'invoked without a block' do
      should 'return the same object' do
        assert_equal @defined, @defined.or_else(3)
      end
    end
  end

  context 'nil objects' do
    context 'invoked with a block' do
      context 'arity zero' do
        should 'invoke the block' do
          assert_equal 2, nil.or_else { 1 + 1 }
        end
      end

      context 'arity larger than zero' do
        should 'invoke the block on nil' do
          assert_equal 1, nil.or_else { |obj| obj.nil? ? 1 : 2 }
        end
      end
    end

    context 'invoked without a block' do
      should 'return the provided value' do
        assert_equal 3, @defined.or_else(3)
      end
    end
  end
end
