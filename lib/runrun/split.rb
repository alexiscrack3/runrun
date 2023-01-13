module RunRun
    class Split
        attr_reader :unit, :distance

        def initialize(unit:, distance: 0)
            raise ArgumentError if distance.nil?

            @unit = unit
            @distance = distance
        end

        def distance_in(unit:)
            case unit
            when Unit::KM
                @distance * 1.60934
            when Unit::MI
                @distance * 0.621371
            end
        end
    end
end
