module BackwardsMethods
  class IndifferentArray < Array
    def include? val
      super(val.to_s) || super(val.to_sym)
    end
  end
end

class Object
  class << self
    [:methods,
      :instance_methods,
      :public_instance_methods,
      :protected_instance_methods,
      :private_instance_methods].each do |n|
      if respond_to?(n)
        define_method "#{n}_with_indifference" do |*args, &block|
         BackwardsMethods::IndifferentArray.new(send("#{n}_without_indifference", *args, &block))
          end
        alias :"#{n}_without_indifference" :"#{n}"
        alias :"#{n}" :"#{n}_with_indifference"
      end
    end
  end

  [:methods].each do |n|
    if respond_to?(n)
      define_method "#{n}_with_indifference" do |*args, &block|
        BackwardsMethods::IndifferentArray.new(send("#{n}_without_indifference", *args, &block))
      end
      alias :"#{n}_without_indifference" :"#{n}"
      alias :"#{n}" :"#{n}_with_indifference"
    end
  end
end
