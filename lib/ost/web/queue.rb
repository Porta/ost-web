require "delegate"

module Ost
  module Web
    class Queue < SimpleDelegator
      def backup?
        !hostname.nil?
      end

      def name
        key_parts[1]
      end

      def hostname
        key_parts[2]
      end

      def pid
        key_parts[3]
      end

      private

      def key_parts
        key.split(":")
      end
    end
  end
end
