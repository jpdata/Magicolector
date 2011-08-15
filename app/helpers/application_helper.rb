module ApplicationHelper
  #Helpers para le menú
  #estructura
  #items=[item1, item2,.., item-n]
  #item-n=["text", URL, subitems]  # son lo items desplegables
  #subitems=["text", URL]
  
  def menu(items)
    res="<ul class=\"topnav\">"
    items.each do |i|
      res+="<li><a href=\"#{i[1]}\">#{i[0]}</a>#{insertarsubitems(i[2])}</li>"
    end
    res+="</ul>"
    res
  end
  
  def insertarsubitems(items)
    if items.length >0 then
      res="<ul class=\"subnav\">"
      items.each do |i|
        res+="<li><a href=\"#{i[1]}\">#{i[0]}</a></li>"
      end
      res+="</ul>"
      res
    end
  end
  
end
