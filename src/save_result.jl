function save_result(res_dir::AbstractString;
        overwrite::Bool = false, 
        comment = "")

    # Tree
    tree = ResDirTree(res_dir);
    
    if !overwrite && isdir(tree) 
        error("$(res_dir) already exist, to overwrite you must explicitly use the keyword!!!"); 
    elseif !isdir(tree)
        mkpath(resdir(tree));
        info("$(resdir(tree)) created!!!")
    else
        info("$(resdir(tree)) overwritten!!!")
    end

    mkpath(sourcedir(tree));
    add_to_log()

end