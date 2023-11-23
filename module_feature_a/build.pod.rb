module Target
    @name = 'module_feature_a'
    @projectFile = 'module_feature_a.xcodeproj'
    @dependencies = []
    
    class << self
        attr_reader :name, :projectFile, :dependencies
    end
end
