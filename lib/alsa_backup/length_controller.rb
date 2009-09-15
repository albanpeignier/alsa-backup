module AlsaBackup
  module LengthController
    class Loop
      def continue_after?(frame_count)
        true
      end
    end

    class FrameCount
      attr_reader :frame_count

      def initialize(frame_count)
        @frame_count = frame_count
      end

      def continue_after?(frame_count)
        (@frame_count -= frame_count) > 0
      end
    end
  end
end
