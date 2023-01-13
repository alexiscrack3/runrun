require "test_helper"
# require "./test/test_helper"
require "runrun/split"
require "runrun/unit"

module RunRun
    class SplitTest < Minitest::Test
        def test_initialize_defaults_distance_to_zero
            assert_raises(ArgumentError) {
                Split.new(unit: Unit::MI, distance: nil)
            }
        end

        def test_initialize_defaults_distance_to_zero
            split = Split.new(unit: Unit::MI)

            assert_equal 0, split.distance
        end
    
        def test_distance_returns_amount
            expected = 1
            
            split = Split.new(unit: Unit::MI, distance: expected)
            
            assert_equal expected, split.distance
        end

        def test_distance_in_returns_conversion_when_unit_is_kilometers
            distance = 1
            expected = distance * 1.60934
            
            split = Split.new(unit: Unit::MI, distance: distance)
            
            assert_equal expected, split.distance_in(unit: Unit::KM)
        end

        def test_distance_in_returns_conversion_when_unit_is_kilometers
            distance = 1
            expected = distance * 0.621371
            
            split = Split.new(unit: Unit::KM, distance: distance)
            
            assert_equal expected, split.distance_in(unit: Unit::MI)
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
    end
end
