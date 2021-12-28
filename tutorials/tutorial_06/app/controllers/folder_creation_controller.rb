class FolderCreationController < ApplicationController

  # file clear
  def read_file 
    session.clear
  end

  # file accept from input
  def read_input_file

    root_folder = "/Users/thura/Desktop/RubyTuto/RUBY_TRAINING/tutorials/tutorial_06/public/"
    folder_name = params[:file_path]
    uploaded_img = params[:file]
    folder_path = root_folder.concat(folder_name)
    show_folder_path = "#{folder_name}"
    img_name = uploaded_img.original_filename

    # file save in specific directory
    unless File.exists?(folder_path)

      Dir.mkdir(folder_path)
      
      # save photo
      FileUtils.copy_file(uploaded_img.tempfile, "#{folder_path}/#{img_name}", preserve = false, dereference = true)
      session[:imgurl] = "/#{show_folder_path}/#{img_name}"
      redirect_to show_file_path

    else

      redirect_to root_path

    end

  end
  
  # show text file's data
  def show_file
    
    @img_url = session[:imgurl]

  end

end
