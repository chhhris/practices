class Foo
  class << self

    def first_job_called
      @first_job_called ||= false
    end

    def second_job_called
      @second_job_called ||= false
    end

    def first
      puts "first"
      first_job_called = true
    end

    def second
      while first_job_called != true
        sleep 1.second
      end
      puts "second"
      second_job_called = true
    end

    def third
      while second_job_called != true
        sleep 1.second
      end
      puts "third"
    end

  end
end


# first solution
# class Foo
#   class << self
#     FIRST = "first"
#     SECOND = "second"
#     THIRD = "third"

#     def called
#       @called ||= []
#     end

#     def first
#       unless called.first == FIRST
#         called = [FIRST]
#         puts FIRST
#       end
#     end

#     def second
#       while called.first != FIRST
#         sleep 5.seconds
#       end
#       puts SECOND
#       called = [FIRST, SECOND]
#     end

#     def third
#       resp = "third"
#       puts resp
#       output += resp
#     end

#   end
# end
