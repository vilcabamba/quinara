# encoding: utf-8
class Question < ActiveRecord::Base

# uploaders
  mount_uploader :media, QuestionMediaUploader

# relationships
  belongs_to :evaluacion
  has_many :answers
  has_many :user_answers

# nested
  accepts_nested_attributes_for :answers, allow_destroy: true

# validations
  validates :puntaje_maximo, numericality: { greater_than: 0, message: "Puntaje máximo de la pregunta no es un número" },
                             presence: { message: "Pregunta debe tener un puntaje máximo" }
  validates :texto, presence: { message: "Pregunta debe tener una instrucción" }
  validates :section, presence: { message: "Pregunta debe pertenecer a una sección" }
  validates :kind, presence: { message: "Pregunta debe ser de un tipo" }
  validate :has_at_least_one_answer

# methods
  def has_at_least_one_answer
    if kind == "Seleccionar una opción"
      errors.add(:base, "Necesita tener al menos dos posibles respuestas") if answers.length < 2
    end
  end
  def is_writing
    section == "Writing"
  end
  def is_listening
    section == "Listening"
  end
  def is_grammar
    section == "Grammar"
  end
  def answer_for_user(user)
    @answer_for_users ||= {}
    @answer_for_users[user.id] or add_answer_for_user(UserAnswer.find_by(user_id: user.id, question_id: id))
  end
  def add_answer_for_user(answer)
    @answer_for_users ||= {}
    @answer_for_users[answer.user.id] = answer
  end
  def score_for_user(user)
    unless instance_variable_get(:"@score_for_user_#{user.username}")
      logger.debug "setting score for user"
      @score = score_for_answer answer_for_user(user)
      instance_variable_set(:"@score_for_user_#{user.username}", @score)
    end
    instance_variable_get :"@score_for_user_#{user.username}"
  end
  def score_for_answer(answer)
    add_answer_for_user answer
    case kind
    when "Seleccionar una opción"
      if answers.find(answer.answer_id).correcta then puntaje_maximo else 0 end
    when "Verdadero o Falso"
      if bool_answer == answer.content then puntaje_maximo else 0 end
    when "Escriba la respuesta"
      if answer.written_answer_grade then answer.written_answer_grade[:score] else 0 end
    when "Escoja la respuesta"
      score = 0
      each_score = puntaje_maximo.to_f / answers.count
      answer.content.each do |answer_id, value|
        if answers.find(answer_id).opcion == value
          score += each_score
        end
      end
      score
    end
  end
  def media_is_video?
    media? and VIDEO_EXTENSIONS.include?(media.sanitized_file.extension.downcase)
  end
  def media_is_audio?
    media? and AUDIO_EXTENSIONS.include?(media.sanitized_file.extension.downcase)
  end
  
# class methods
  def self.kinds # tipos de pregunta
    ["Seleccionar una opción", "Verdadero o Falso", "Escriba la respuesta", "Escoja la respuesta"]
  end
  def self.sections
    %w(Listening Writing Grammar)
  end
  def self.process_answer(question_id, answer)
    question = find question_id
    case question.kind
    when "Seleccionar una opción"
      { question_id: question_id, answer_id: answer }
    when "Verdadero o Falso"
      { question_id: question_id, content: eval(answer) }
    when "Escriba la respuesta"
      { question_id: question_id, content: answer }
    when "Escoja la respuesta"
      { question_id: question_id, content: answer }
    end
  end

end
