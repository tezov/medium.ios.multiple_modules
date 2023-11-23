module Target
    @name = 'module_feature_b'
    @projectFile = 'module_feature_b.xcodeproj'
    @dependencies = ['core.SwiftDate']
    
    class << self
        attr_reader :name, :projectFile, :dependencies
    end
end
