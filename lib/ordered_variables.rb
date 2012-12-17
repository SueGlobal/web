# -*- encoding : utf-8 -*-
class OrderedVariables
  attr_reader :sample

  def initialize(sample)
    @sample = sample
  end

  def segments
    @segments ||= sample.segments
  end

  def values
    @values ||= if sample.new_record?
                  gen_empty_values
                else
                  ordered_values
                end
  end

  def variables
    @variables ||= segments.map(&:segmentation_variable).uniq
  end

  def segments_by_variable
    @segments_by_variable ||= variables.each_with_object({}) do |var, memo|
      memo[var] = segments.select { |s| s.segmentation_variable == var }
    end
  end

  def values_by_variable
    @values_by_variable ||= variables.each_with_object({}) do |var, memo|
      memo[var] = segments_by_variable[var].flat_map(&:segmentation_variable_values).uniq.sort_by(&:order)
    end
  end

  def variable_values
    @variable_values ||= variables_by_number_of_values.each_with_object([]) do |obj, memo|
      memo.push values_by_variable[obj]
    end
  end

  def variables_by_number_of_values
    @variables_by_number_of_values ||= variables.sort_by do |var|
      values_by_variable[var].size
    end
  end

  def column_variable_values
    values_by_variable[column_variable]
  end

  def column_variable
    variables_by_number_of_values.first
  end

  def row_variables
    @row_variables ||= variables_by_number_of_values[1..-1] || []
  end

  def main_row_variable
    row_variables.first
  end

  def rest_row_variables
    row_variables[1..-1].reverse || []
  end

  def table_for_values
    values.each_slice(values_by_variable[column_variable].size).to_a
  end

  def table_for_variables
    rv = row_variables.reverse.map { |var| values_by_variable[var] }
    rv.first.product(*rv[1..-1])
  end

  def complete_table
    table_for_variables.zip(table_for_values).map do |arr|
      arr.first + arr.last
    end
  end

  protected
  def gen_empty_values
    variable_values_combinations.each_with_object([]) do |val, memo|
      memo << sample.new_value_for(*val)
    end
  end

  def ordered_values
    variable_values_combinations.each_with_object([]) do |val, memo|
      memo << sample.value_for(*val)
    end
  end

  def variable_values_combinations
    vvs = variable_values.reverse
    vvs.first.product(*vvs[1..-1])
  end
end
