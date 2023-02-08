require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end

    
end


class Users
 attr_accessor :author_id, :fname, :lname

 def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL,author_id)
        SELECT 
        *
        FROM
        users
        WHERE
        author_id = ?
     SQL
     return nil unless user.length > 0
     Users.new(user.first)
    end

    def initialize(options)
        @author_id = options['author_id']
        @fname = options['fname']
        @lname = options['lname']

    end
end

class Questions
    attr_accessor :question_id, :title, :body, :author_id

 def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum) }
  end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
        *
        FROM
        questions
        WHERE
        question_id = ?
     SQL
     return nil unless question.length > 0
     Questions.new(question.first)
    end

    def initialize(options)
        @question_id = options['question_id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end

class QuestionFollows
    attr_accessor :question_follows_id, :author_id, :question_id

    def self.all
       data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
       data.map { |datum| QuestionFollows.new(datum) }
     end
   
       def self.find_by_id(id)
           questionfollow = QuestionsDatabase.instance.execute(<<-SQL, question_follows_id)
           SELECT 
           *
           FROM
           question_follows
           WHERE
           question_follows_id = ?
        SQL
        return nil unless questionfollow.length > 0
        QuestionFollows.new(questionfollow.first)
       end
   
       def initialize(options)
           @question_follows_id = options['question_follows_id']
           @author_id = options['author_id']
           @question_id = options['question_id']
       end
end

class Replies
end

class QuestionsLike
end