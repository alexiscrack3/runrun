require "test_helper"
# require "./test/test_helper"
require "runrun/interval"

module Runrun
    class IntervalTest < Minitest::Test
        def test_blah
            interval = Interval.new
            assert_equal 1, interval.whatever
        end
    end
end
