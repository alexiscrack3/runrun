require "active_support/time"

module RunRun
    class Split
        attr_reader :unit, :distance, :duration

        def initialize(unit:, distance: 0, duration: 1.seconds)
            raise ArgumentError if distance.nil?
            raise ArgumentError if duration.nil?

            @unit = unit
            @distance = distance
            @duration = duration
        end

        def distance_in(unit:)
            case unit
            when Unit::KM
                @distance * 1.60934
            when Unit::MI
                @distance * 0.621371
            end
        end

        def pace
            total_minutes = @duration.in_minutes
            pace = total_minutes / @distance.to_f
            minutes = pace.to_i
            remainder = pace - minutes
            seconds = (remainder * ActiveSupport::Duration::SECONDS_PER_MINUTE).round
            "#{minutes}:#{format("%02d", seconds)} mins/mi"
        end
    end
end
