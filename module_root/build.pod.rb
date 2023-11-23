module Target
    @name = 'module_root'
    @projectFile = 'module_root.xcodeproj'
    @dependencies = ['core.SwiftDate']
    
    class << self
        attr_reader :name, :projectFile, :dependencies
    end
end
