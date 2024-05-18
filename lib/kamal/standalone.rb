# frozen_string_literal: true

require 'kamal'

module Kamal
  module Standalone
    class Error < StandardError; end
    # Your code goes here...
  end
end

require_relative "standalone/app"
require_relative "standalone/cli"

