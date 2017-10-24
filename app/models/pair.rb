class Pair < ApplicationRecord
  has_many :users

def make_pairs
  round_robin
  self.combinations << @pairs
end

private

  def round_robin
    @users = User.all
    @students = @users.select {|a| a.not_admin?}
    student_emails
      @pairs = (1...@student_emails.size).map do |r|
      s = @student_emails.dup
      (0...(@student_emails.size/2)).map do |_|
      [s.shift,s.delete_at(-(r % s.size + (r >= s.size * 2 ? 1 : 0)))]
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
