class Pair < ApplicationRecord
  has_many :users, autosave: true

def make_pairs
  round_robin
  self.combinations = @pairs
end

private

  def round_robin
    @users = User.all
    @students = @users.select {|a| a.not_admin?}
    student_emails
      @pairs = (1...@student_emails.size).map do |x|
      s = @student_emails.dup
      (1..(@student_emails.size/2)).map do |y|
      index = -(x % s.size)
      [s.shift,s.delete_at(index)]
     end
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
