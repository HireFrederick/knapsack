require 'knapsack'

namespace :knapsack do
  task :rspec, [:rspec_args] do |_, args|
    Knapsack::Runners::RSpecRunner.run(args[:rspec_args])
  end

  task :parallel_rspec, [:rspec_args] do |_, args|
    Knapsack::Runners::ParallelRSpecRunner.run(args[:rspec_args])
  end
end
