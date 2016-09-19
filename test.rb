require_relative 'alternatives_optimizator'

p AlternativesOptimizator.new('file.txt', AlternativesOptimizator::PARETO).perform

# variants:
#
# 2 2 9 4 4 6 4 2 1 1 0 0 6 3 7 0 2 3 4 2
# 2 8 9 3 6 8 0 2 1 0 5 1 1 0 8 5 0 6 4 6
#
# 2 6 0 1 8 5 2 3 6 2 5 3 5 9 7 5 6 7 7 3
# 2 5 8 6 2 8 4 7 2 4 1 6 2 9 9 0 8 1 3 1
#
# 8 3 3 9 6 6 9 8 9 9 5 7 1 6 9 9 2 6 8 4
# 1 0 3 4 0 3 9 1 9 6 9 3 3 8 0 5 6 6 4 0
#
# 2 2 9 4 4 6 4 2 1 1 0 0 6 3 7 0 2 3 4 2 2 6 0 1 8 5 2 3 6 2 5 3 5 9 7 5 6 7 7 3 8 3 3 9 6 6 9 8 9 9 5 7 1 6 9 9 2 6 8 4
# 2 8 9 3 6 8 0 2 1 0 5 1 1 0 8 5 0 6 4 6 2 5 8 6 2 8 4 7 2 4 1 6 2 9 9 0 8 1 3 1 1 0 3 4 0 3 9 1 9 6 9 3 3 8 0 5 6 6 4 0
