require "test_helper"
# require "./test/test_helper"
require "runrun/split"
require "runrun/unit"

module RunRun
    class SplitTest < Minitest::Test
        def test_initialize_raises_exception_when_distance_is_nil
            assert_raises(ArgumentError) {
                Split.new(unit: Unit::MI, distance: nil)
            }
        end

        def test_initialize_raises_exception_when_duration_is_nil
            assert_raises(ArgumentError) {
                Split.new(unit: Unit::MI, duration: nil)
            }
        end

        def test_initialize_defaults_distance_to_zero
            split = Split.new(unit: Unit::MI)

            assert_equal 0, split.distance
        end

        def test_initialize_defaults_duration_to_zero_seconds
            expected = 0.second

            split = Split.new(unit: Unit::MI, duration: expected)

            assert_equal expected, split.duration
        end
    
        def test_distance_returns_amount
            expected = 1

            split = Split.new(unit: Unit::MI, distance: expected)

            assert_equal expected, split.distance
        end
    
        def test_duration_returns_time
            expected = 1.seconds

            split = Split.new(unit: Unit::MI, distance: expected, duration: expected)

            assert_equal expected, split.duration
        end

        def test_distance_in_returns_conversion_when_unit_is_kilometers
            distance = 1
            expected = distance * 1.60934

            split = Split.new(unit: Unit::MI, distance: distance)

            assert_equal expected, split.in_kilometers
        end

        def test_distance_in_returns_conversion_when_unit_is_kilometers
            distance = 1
            expected = distance * 0.621371

            split = Split.new(unit: Unit::KM, distance: distance)

            assert_equal expected, split.in_miles
        end

        def test_unit_returns_miles
            expected = Unit::MI

            split = Split.new(unit: expected, distance: 0)

            assert_equal expected, split.unit
        end

        def test_unit_returns_kilometers
            expected = Unit::KM

            split = Split.new(unit: expected, distance: 0)

            assert_equal expected, split.unit
        end

        def test_pace_returns_pace_in_miles_when_pace_only_has_minutes
            expected = "8:00 mins/mi"

            split = Split.new(unit: Unit::MI, distance: 2, duration: 16.minutes)

            assert_equal expected, split.pace
        end

        def test_pace_returns_pace_in_miles_when_distance_is_10K
            expected = "6:54 mins/mi"
            duration = 42.minutes + 44.seconds

            split = Split.new(unit: Unit::MI, distance: 6.2, duration: duration)

            assert_equal expected, split.pace
        end

        def test_pace_returns_pace_in_miles_when_distance_is_half_marathon
            expected = "6:52 mins/mi"
            duration = 1.hour + 29.minutes + 58.seconds

            split = Split.new(unit: Unit::MI, distance: 13.1, duration: duration)

            assert_equal expected, split.pace
        end

        def test_pace_returns_pace_in_miles_when_distance_is_marathon
            expected = "6:27 mins/mi"
            duration = 2.hour + 48.minutes + 50.seconds

            split = Split.new(unit: Unit::MI, distance: 26.2, duration: duration)

            assert_equal expected, split.pace
        end
    end
end
