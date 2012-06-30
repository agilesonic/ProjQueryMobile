module HomeHelper
  def file_link(dir, file)
    path = File.join HomeController::PAGE_DIR, dir, file
    if File.directory? path
      "/home/index?dir=" + File.join(dir, file)
    else
      "/pages/" + File.join(dir, file)
    end
  end
end
