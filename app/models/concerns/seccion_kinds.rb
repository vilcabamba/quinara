module SeccionKinds
  extend ActiveSupport::Concern

  module ClassMethods
    def kinds
      @@kinds ||= %w(Grammar Vocabulary Reading Writing Speaking Listening)
    end
    def written_kinds
      @@written_kinds ||= %w(Grammar Vocabulary Reading Writing)
    end
    def oral_kinds
      @@oral_kinds ||= %w(Speaking Listening)
    end
  end
end