# We fake the login process in the engine, as we don't know how the actual
# application would have it set up. Guessing is best, currently.

def login!(options={})
  # Fake user, provided by our fake "model".
  # HACK HACK HACK.
  # This is done so we can use the options to define how the current_user method is defined.
  # Better ideas?
  ApplicationController.class_eval <<-STRING
    def current_user
      attributes = { :login => "rubyx" }
      #{"attributes.merge!(:context_admin => true)" if options[:admin]}

      User.new(attributes)
    end
  STRING
end