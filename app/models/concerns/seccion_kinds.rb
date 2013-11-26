module SeccionKinds
  extend ActiveSupport::Concern

  module ClassMethods
    def kinds
      %w(Listening Writing Grammar Vocabulary Reading)
    end
  end
end