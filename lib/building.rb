class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.sum {|unit|
      unit.monthly_rent.to_f / @units.length}
  end

  def renter_with_highest_rent
    @units.max_by do |unit|
      unit.monthly_rent
      if unit.renter != nil
        return unit.renter
      end
    end
  end

  def annual_breakdown
    breakdown = Hash.new
    @units.map do |unit|
      if unit.renter != nil
        then breakdown[unit.renter.name] = (unit.monthly_rent * 12)
      end
    end
    breakdown
  end
end
