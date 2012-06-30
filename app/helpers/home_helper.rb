module HomeHelper
  def dir?(dir, file)
    path = File.join HomeController::PAGE_DIR, dir, file
    File.directory? path
  end
  
  def dir_link(dir, file)
      "/home/index?dir=" + File.join(dir, file)
  end

  def file_link(dir, file)
      "/pages/" + File.join(dir, file)
  end
  
  def code_link(dir, file)
      "/home/code?dir=" + File.join(dir, file)
  end
end
