class FileReaderController < ApplicationController
  # file clear
  def read_file 
    session.clear
  end

  # file accept from input
  def read_input_file

    uploaded_file = params[:file]
    file_content = uploaded_file.read
    session[:file_content] = file_content
    redirect_to show_file_path

  end
  
  # show text file's data
  def show_file
    
    @content = session[:file_content]

  end

end
