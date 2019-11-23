function amend_description(res_dir::String, new_comment::String, 
        sources::Vector{String})
    tree = Core.ResDirTree(res_dir);
    desc = Core.build_description(Core.resdir(tree), 
        new_comment * " (Description amended!!!)", sources);
    Core.save_desc(tree, desc);
    Core.add_to_log(tree, desc);
end