# -*- encoding : utf-8 -*-
module ApplicationHelper  
  #フラッシュでエラーメッセージを表示する  
  def flash_error_message
    return unless flash[:message]
    content_tag :div, {:id => "error_explanation"} do 
      content_tag :h2,flash[:message]
    end
  end
  
  #モデル属性名を取得する
  def attr_name(object, name)
    if object.kind_of?(String) or object.kind_of?(Symbol)
      classname = object.to_s
    else
      classname = object.class.name.downcase
    end
    I18n.t( 'activerecord.attributes.' + classname + '.' + name.to_s)
  end
  
  def required
    content_tag(:span,'*',{:class => "required"})
  end
 
 def li_with_active(path, &block)
   content_tag(:li, {:class => path == request.path ? "active" : ""},&block)
 end
end
