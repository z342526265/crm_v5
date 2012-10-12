# encoding: utf-8
module ApplicationHelper
  #必填字段标示
  def required_tag
    content_tag(:b,"※",:style=>"color:red")
  end

  #格式化日期
  def time_show_date(time)
    time.strftime("%y年%m月%d日")  rescue "-"
  end

  #格式化时间
  def time_format(time)
    time.strftime("%y-%m-%d %H:%M")  rescue "-"
  end


  def url_content_tag(content)
    require 'uri'
    URI(content)
  end

  def link_to_custom(*args)
    name         = args[0]
    options      = args[1] || {}
    html_options = args[2]

    hash = options.is_a?(Hash) ? options : Rails.application.routes.recognize_path(url_for(options))
    current_c_action = "#{hash[:controller]}-#{hash[:action]}"

    if @current_user.can_visit?(current_c_action)
      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_for(options)

      href = html_options['href']
      tag_options = tag_options(html_options)

      href_attr = "href=\"#{ERB::Util.html_escape(url)}\"" unless href
      "<a #{href_attr}#{tag_options}>#{ERB::Util.html_escape(name || url)}</a>".html_safe
    else
      return name
    end
  end

  #菜单链接
  #效果： 点击菜单之后，被点击的菜单在刷新之后表现为被点击状态
  #第4个参数为点击之后要表现出来的class
  def link_to_menu_custom(*args)
    name         = args[0]
    options      = args[1] || {}
    html_options = args[2]

    #自动给链接添加上onclick事件，保存当前链接的menu_num值到cookie中
    html_options["onclick"] = "$.cookie('menu_num',#{html_options[:menu_num]}, {expires: 7,path:'/', domain:document.domain});"

    hash = options.is_a?(Hash) ? options : Rails.application.routes.recognize_path(url_for(options))
    current_c_action = "#{hash[:controller]}-#{hash[:action]}"

    if @current_user.can_visit?(current_c_action)
      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_for(options)

      href = html_options['href']
      tag_options = tag_options(html_options)

      href_attr = "href=\"#{ERB::Util.html_escape(url)}\"" unless href
      "<a #{href_attr}#{tag_options}>#{ERB::Util.html_escape(name || url)}</a>".html_safe
    else
      return name
    end
  end


  def truncate_with_more (text, cutoff, id)
    if text.length > cutoff
      result = text[0, cutoff]
      result += "<span id='text_more_link_#{id}'>&hellip;"
      result += "<a href='#' onclick='$(\"text_more_#{id}\").show(); $(\"text_more_link_#{id}\").hide(); return false;'>"
      result += "more</a></span>"
      result += "<span id='text_more_#{id}' style='display: none;'>"
      result += text[cutoff, text.length]
      result += "</span>"
    else
      result = text
    end

    result
  end

  def is_must_fill(field)
    @client_fields.include? field
  end

  def pages_count(total_pages,every_pages)
    total_pages % every_pages == 0 ? total_pages / every_pages : total_pages / every_pages + 1  rescue "-"
  end


end
