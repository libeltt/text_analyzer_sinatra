require 'sinatra'

get '/' do
  erb :index  # Render the form
end

post '/analyze' do
  text = params[:text]  # Grab the text from the form
  @line_count = text.lines.count
  @total_characters = text.length
  @total_characters_nospaces = text.gsub(/\s+/, '').length
  @word_count = text.split.length
  @paragraph_count = text.split(/\n\n+|\n(?=[A-Z])/).reject(&:empty?).length
  @sentence_count = text.split(/[.!?]/).length
  erb :result  # Render the result page
end
