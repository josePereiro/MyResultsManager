function save_result(res_dir::String, data;
        overwrite::Bool = false, 
        comment = "", 
        sources::Vector{String} = Vector{String}(),
        verbose = true)

    # Tree
    tree = Core.ResDirTree(res_dir);
    if !overwrite && isdir(tree)
        error("$(Core.resdir(tree)) already exist, to overwrite you must explicitly use the keyword!!!"); 
    end

    try 

        # Dirs
        if !isdir(tree)
            mkpath(Core.resdir(tree));
            verbose && info("$(Core.resdir(tree)) created!!!")
        else
            verbose && info("$(Core.resdir(tree)) overwritten!!!")
        end
        mkpath(Core.sourcedir(tree));

        # Description
        desc = Core.build_description(res_dir, comment, sources);
        Core.save_desc(tree, desc);
        Core.add_to_log(tree, desc);

        # sources
        for src in sources
            if isdir(src)
                MyTools.copy_folder_gitless(src, Core.sourcedir(tree), 
                    follow_symlinks = true, overwrite = overwrite);
                if verbose 
                    info("copying: $(src) to $(Core.sourcedir(tree))");
                end
            elseif isfile(src)
                dest = joinpath(Core.sourcedir(tree), basename(src));
                cp(src, dest, follow_symlinks = true, 
                    remove_destination = overwrite)
                verbose && info("copying: $(src) to $(Core.sourcedir(tree))");
                
            else
                ms = "Warn: copying: $(src) to $(Core.sourcedir(tree)) fails!!!"
                verbose && warn(ms);
                Core.add_to_log(tree, ms);
            end
        end

        # Data
        Core.save_data(tree, data);
    catch err
        if !overwrite
            rm(Core.resdir(tree), force = true, recursive = true);
        end
        throw(err);
    end

end