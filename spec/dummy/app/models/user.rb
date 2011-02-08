class User
  attr_accessor :login, :context_admin

  def initialize(attributes={})
    attributes.each do |k, v|
      self.send("#{k}=", v) if respond_to?("#{k}=")
    end
  end
end