class Pair < ApplicationRecord
  has_many :users

def make_pairs
  round_robin
  self.combinations = @pairs
  self.save

end

def pair_per_day
  @day = self.combinations.slice!(0)
end


private

  # def round_robin
  #   @users = User.all
  #   @students = @users.select {|a| a.not_admin?}
  #   student_emails
  #     @pairs = (1...@student_emails.size).map do |x|
  #     s = @student_emails.dup
  #     (1..(@student_emails.size/2)).map do |y|
  #     index = -(x % s.size)
  #     [s.shift,s.delete_at(index)]
  #    end
  # end
  #
  # end

  def round_robin
    @users = User.all
    @students = @users.select {|a| a.not_admin?}
    @pairs = []
    student_emails

    for i in 1...(@students.count)

      @day = []

      s = @student_emails.dup

      for i in 1..(@students.count/2) do
        @day << [s.first,s.last]
        s.slice!(0)
        s.slice!(s.count-1)
      end

      @pairs << @day

      @student_emails.insert(1,@student_emails.delete_at(@student_emails.count-1))
    end

  end

  def student_emails
    @users = User.all
    @students = @users.select {|a| a.not_admin?}
    @student_emails = []
    @students.each do |student|
      @student_emails << student.email
    end
  end



end
