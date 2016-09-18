class AlternativesOptimizator
  PARETO = 0
  SLEITER = 1

  def initialize(file_name, optimization_type)
    @optimization_type = optimization_type
    raise 'error. unknown optimization type' unless [PARETO, SLEITER].include?(@optimization_type)
    read_matrix(file_name)
    form_alternatives_list
  end

  def perform
    i = 0
    while(i < @alternatives_list.length) do
      j = i + 1
      while(j < @alternatives_list.length) do
        if compare(i, j)
          @alternatives_list.delete_at(j)
        elsif compare(j, i)
          @alternatives_list.delete_at(i)
          break
        else
          j += 1
        end
      end
      i += 1
    end

    @alternatives_list
  end

  private

  def read_matrix(file_name)
    @matrix = []
    @line_count = 0

    File.open(file_name) do |f|
      f.each_line do |line|
        @matrix << line.split.map(&:to_i)
        @line_count += 1
      end
    end
  end

  def form_alternatives_list
    @alternatives_list = @matrix.first.length.times.map { |n| [get_alternative(n), "A#{n+1}"] }
  end

  def get_alternative(j)
    @line_count.times.map { |n| @matrix[n][j] }
  end

  def compare(i, j)
    case @optimization_type
    when PARETO
      at_least_one_greater = false
      @line_count.times do |n|
        at_least_one_greater = true if @alternatives_list[i][0][n] > @alternatives_list[j][0][n]
        return false if @alternatives_list[i][0][n] < @alternatives_list[j][0][n]
      end

      at_least_one_greater
    when SLEITER
      @line_count.times do |n|
        return false if @alternatives_list[i][0][n] <= @alternatives_list[j][0][n]
      end

      true
    end
  end
end
