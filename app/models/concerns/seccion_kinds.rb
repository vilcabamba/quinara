module SeccionKinds
  extend ActiveSupport::Concern

  module ClassMethods
    def kinds
      @@kinds ||= written_kinds + oral_kinds
    end
    def written_kinds
      @@written_kinds ||= %w(Grammar Vocabulary Reading Writing)
    end
    def oral_kinds
      @@oral_kinds ||= %w(Speaking Listening)
    end
  end
end
