module Kernel
  def require_with_project_root(string)
    begin
      begin
        require_without_project_root(string) 
      rescue LoadError => e
        # Agni.logger.debug "#{e}: require '#{string}' invoked from #{caller[0]} failed, trying within #{AGNI_ROOT}/lib/agni..."
        require_without_project_root("#{AGNI_ROOT}/lib/agni/#{string}")
      end  
    rescue Exception => e
      Agni.logger.info "#{e}: require '#{string}' invoked from #{caller[0]} failed!"
      raise e
    end  
  end
  alias_method_chain :require, :project_root
end