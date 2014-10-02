require "optionate/version"
require 'active_support/core_ext/object/try'

class Object
  def or_else(*args)
    self
  end

  def on_present(&b)
    tap(&b)
  end

  def on_nil(&b)
    self
  end

  def then(&b)
    if b.arity.zero?
      instance_eval(&b)
    else
      yield self
    end
  end
end

class NilClass
  def or_else(*a, &b)
    if a.empty? && block_given?
      if b.arity.zero?
        instance_eval(&b)
      else
        yield self
      end
    else
      a.first
    end
  end

  def on_present(&b)
    self
  end

  def on_nil(&b)
    tap(&b)
  end

  def then(&b)
    if b.arity.zero?
      instance_eval(&b)
    else
      yield self
    end
  end
end
