require 'knapsack'

namespace :knapsack do
  task :cucumber, [:cucumber_args] do |_, args|
    Knapsack::Runners::CucumberRunner.run(args[:cucumber_args])
  end

  task :parallel_cucumber, [:cucumber_args] do |_, args|
    Knapsack::Runners::ParallelCucumberRunner.run(args[:cucumber_args])
  end
end
