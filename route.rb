require_relative "modules"

class Route 
  extend  Counter::ClassMethods
  NAME_FORMAT_ROUTE = /^[a-я]{25}(\s|-)[а-я]{25}$/i   # формат по типу "25 букв"
  
  def initialize(name)
    @name = name
    @stations = []
    register_instance
    validate!
  end

  def add_station(station)
    @stations << station
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def valid?
    validate!
  rescue
    false
  end

  protected
  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name has invalid format" if name !~ NAME_FORMAT_ROUTE
    true 
  end

  private
  include Counter::InstanceMethods
end
