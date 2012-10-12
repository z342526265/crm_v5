# encoding: utf-8
module CustomAssociationMethod

def method_missing(method, *args, &block)
  method = method.to_s
  if method.include?("_by_")
    super
  else
    case method
      when /[\w]+_name$/
        m = method.sub(/_name$/,"")
        if self.respond_to?(m)
          return self.send(m).name rescue "-"
        else
          super
        end
      when /[\w]+_names$/
        m = method.sub(/_names$/,"")
        if self.respond_to?(m)
          return self.send(m).map{|u|u.name}.join(",") rescue "-"
        else
          super
        end
      else
        super
    end
  end

end


end