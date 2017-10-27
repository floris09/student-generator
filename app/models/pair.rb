class Pair < ApplicationRecord

def make_pairs
  round_robin
  self.combinations = @pairs
  self.save
end


private


  def round_robin
    @users = User.all
    @students = @users.select {|a| a.not_admin?}
    @pairs = []
    student_names

    for i in 1...(@students.count)

      @day = []

      s = @student_names.dup

      for i in 1..(@students.count/2) do
        if s.count == 3
          @day << [s[0], "#{s[1]} - #{s[2]}"]
        else
          @day << [s.first,s.last]
          s.slice!(0)
          s.slice!(s.count-1)
        end
      end

      @pairs << @day

      @student_names.insert(1,@student_names.delete_at(@student_names.count-1))
    end

  end

  def student_names
    @users = User.all
    @students = @users.select {|a| a.not_admin?}
    @student_names = []
    @students.each do |student|
      @student_names << student.full_name
    end
    @student_names = @student_names.shuffle
  end



end
