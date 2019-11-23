function find_results(root_dir::String = "."; 
        feedback_function::Function = function(x) end)
    
    fun = function(path)
        if isdir(path)
            tree = Core.ResDirTree(path);
            if isfile(Core.datafile(tree)) && 
                isfile(Core.logfile(tree)) &&
                isfile(Core.descfile(tree))

                feedback_function(path);
                return true;
            else
                return false;
            end
        else
            return false;
        end
    end

    return MyTools.filter_from!(root_dir, fun);
end