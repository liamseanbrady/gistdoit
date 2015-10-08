require 'minitest/autorun'
require_relative './test_helper'
require 'gistdoit/cli'

class CLITest< Minitest::Test
  def test_recognizes_start_option
    cli_double = Class.new(GistDoIt::CLI) do
      def start(*args)
        if %w(create).include?(args.first)
          gist.create(args[1])
        elsif args.size == 1
          gist.create(args.first)
        else
          raise ArgumentError, "#{args.first} is not a validoption"
        end
      end

      def gist
        Struct.new("Gist") { def create(args); true; end }.new
      end
    end

    assert cli_double.start('create', 'file.rb')
  end
end
