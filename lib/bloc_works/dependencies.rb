class Object
  def self.const_missing(const)
    if const
      require BlocWorks.snake_case(const.to_s)
      Object.const_get(const)
    end
  end
end
