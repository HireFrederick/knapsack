module Knapsack
  module Runners
    class ParallelRSpecRunner
      def self.run(args)
        allocator = Knapsack::AllocatorBuilder.new(Knapsack::Adapters::RspecAdapter).allocator

        puts
        puts 'Report specs:'
        puts allocator.report_node_tests
        puts
        puts 'Leftover specs:'
        puts allocator.leftover_node_tests
        puts

        cmd = %Q[bundle exec parallel_rspec #{args} -- --default-path #{allocator.test_dir} -- #{allocator.stringify_node_tests}]

        system(cmd)
        exit($?.exitstatus)
      end
    end
  end
end
