# VERSION
Version = {
    core: {
        SwiftDate: '7.0.0'
    }
}

# COORDINATES
Library = {
    core: {
        SwiftDate: lambda do |podfileContext|
            podfileContext.pod 'SwiftDate', git: 'https://github.com/malcommac/SwiftDate.git', tag: Version[:core][:SwiftDate]
        end
    }
}



# TOOLBOX FUNCTION

def library(podfileContext, coordinate)
    keys = coordinate.split('.')
    endpoint = Library
    keys.each do |key|
        key_sym = key.to_sym
        unless endpoint.key?(key_sym)
            puts "\e[31m !!!!!!! coordinate: #{coordinate} not found in Library \e[0m"
            return
        end
        endpoint = endpoint[key_sym]
    end
    endpoint.call(podfileContext)
end


def isFileExists?(path)
    if !File.exist?(path)
        puts "\e[31m !!!!!!! #{projectPath} does not exist  \e[0m"
        return false
    end
    return true
end


def addTarget(podfileContext, targetPath)
    filePath = "#{targetPath}/build.pod.rb"
    return [] unless isFileExists?(filePath)
    load filePath
    puts "** Add target #{Target.name}"
    podfileContextLambda = lambda do
        target Target.name do
            projectPath = "#{targetPath}/#{Target.projectFile}"
            return [] unless isFileExists?(projectPath)
            project projectPath
            use_frameworks!
            Target.dependencies.each do |dependency|
                puts "- #{dependency}"
                library(self, dependency)
            end
        end
    end
    podfileContext.instance_exec(&podfileContextLambda)
    Target.dependencies
end



