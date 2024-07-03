require_relative "modules"

class Station 
  extend  Counter::ClassMethods
  attr_reader :name, :trains
  NAME_FORMAT_STATION = /^[a-я]{3,25}(\s|-)[а-я]{3,25}$/i   # формат по типу "25 букв"

  def self.all 
    @trains
  end
  
  def initialize(name)
    @name = name
    @trains = []
    register_instance
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_train_on_station(train)
    @trains << train
  end

  protected
  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name has invalid format" if name !~ NAME_FORMAT_STATION
    true 
  end

  private
  include Counter::InstanceMethods
end
