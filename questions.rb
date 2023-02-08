require 'sqlite3'
require 'singleton'

class QuestionsDataBase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end

    
end


class Users
 attr_accessor :author_id, :fname, :lname

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
end

class QuestionFollows
end

class Replies
end

class QuestionsLike
end