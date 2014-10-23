require 'csv'
require 'models/meal'

class MealsRepository
  attr_reader :csv_filename

  def initialize
    @csv_filename = "#{__dir__}/meals.csv"
  end

  def all
    meals
  end

  def find_all(ids)
    meals.select { |meal| ids.include?(meal.id) }
  end

  private

  def meals
    records = CSV.read(csv_filename, headers: :first_row, header_converters: :symbol)
    records.map { |record| Meal.new(record) }
  end
end
