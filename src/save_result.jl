function save_result(tree::ResDirTree, data;
        overwrite::Bool = false, 
        comment = "", 
        sources::Vector{String} = Vector{String}(),
        verbose = true)

    # Dirs
    if !overwrite && isdir(tree)
        error("$(resdir(tree)) already exist, to overwrite you must explicitly use the keyword!!!"); 
    elseif !isdir(tree)
        mkpath(resdir(tree));
        verbose && info("$(resdir(tree)) created!!!")
    else
        verbose && info("$(resdir(tree)) overwritten!!!")
    end
    mkpath(sourcedir(tree));

    # Description
    desc = build_description(comment, sources);
    write(descfile(tree), desc);
    add_to_log(tree, desc);

    # Data
    save_data(datafile(tree), data);

    # sources
    for src in sources
        if isdir(src)
            copied = MyTools.copy_folder_gitless(src, sourcedir(tree), 
                follow_symlinks = true);
            if verbose 
                info("copying: $(src) to $(sourcedir(tree))");
            end
        elseif isfile(src)
            cd(src, sourcedir(tree), follow_symlinks = true)
            verbose && info("copying: $(src) to $(sourcedir(tree))");
            
        else
            ms = "Error: copying: $(src) to $(sourcedir(tree)) fails!!!"
            verbose && warn(ms);
            add_to_log(tree, ms);
        end
    end

end