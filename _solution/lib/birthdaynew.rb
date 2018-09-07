class BirthdayNew
  def initialize(name,date)
    @date = date
    @name = name
  end

  def pass_hash
    { name: @name, birthday: @date }
  end
end
