class HomeController < ApplicationController
  
  PAGE_DIR = File.expand_path("../../../public/pages", __FILE__)
  
  def index
    @dir = params[:dir] || "" 
    path = File.expand_path(File.join(PAGE_DIR, @dir))
    if( path.start_with? PAGE_DIR )
      @dir = path.sub(PAGE_DIR, '')
    else
      @dir = ""
    end
    @dir = "/" if @dir == ""
    @files = Dir.entries(File.join(PAGE_DIR, @dir)).select { |f| f != "." }.sort do | f1, f2 |
      if f1.length > 2 && f2.length > 2 && f1[0, 2] == "ch" && f2[0, 2] == "ch"
        f1[2, f1.length - 2].to_i <=> f2[2, f2.length - 2].to_i
      else
        f1 <=> f2 
      end
    end
  end

end
