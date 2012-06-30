class HomeController < ApplicationController
  
  PAGE_DIR = File.expand_path("../../../public/pages", __FILE__)
  
  def index
    dir
    path = File.join(PAGE_DIR, @dir)
    if !File.directory? path
      redirect_to "/home/index"
    end
    @files = Dir.entries(path).select { |f| f != "." }.sort do | f1, f2 |
      if f1.length > 2 && f2.length > 2 && f1[0, 2] == "ch" && f2[0, 2] == "ch"
        f1[2, f1.length - 2].to_i <=> f2[2, f2.length - 2].to_i
      else
        f1 <=> f2 
      end
    end
  end
  
  def code
    dir
    path = File.join(PAGE_DIR, @dir)
    if File.directory? path || File.extname(path) != ".html"
      redirect_to "/home/index"
    end
    @file = File.open(path)
  end
  
  private
  def dir
    @dir = params[:dir] || "" 
    path = File.expand_path(File.join(PAGE_DIR, @dir))
    if( path.start_with? PAGE_DIR )
      @dir = path.sub(PAGE_DIR, '')
    else
      redirect_to "/home/index"
    end
    @dir = "/" if @dir == ""
  end

end
