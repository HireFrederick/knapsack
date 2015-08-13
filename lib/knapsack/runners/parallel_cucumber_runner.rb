module Knapsack
  module Runners
    class ParallelCucumberRunner
      def self.run(args)
        allocator = Knapsack::AllocatorBuilder.new(Knapsack::Adapters::CucumberAdapter).allocator

        puts
        puts 'Report features:'
        puts allocator.report_node_tests
        puts
        puts 'Leftover features:'
        puts allocator.leftover_node_tests
        puts

        cmd = %Q[bundle exec parallel_cucumber #{args} -- #{allocator.stringify_node_tests}]

        system(cmd)
        exit($?.exitstatus)
      end
    end
  end
end
