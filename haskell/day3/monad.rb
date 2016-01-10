# Implement a Monad in a nonfunctional language. (See the article series on monads in Ruby.)
class Monad
  attr_reader :value

  def initialize(value)
    @value = value
  end

  class << self
    def unit(value)
      new value
    end

    def bind
      yield @value
    end
  end
end

# gem 'monads'
