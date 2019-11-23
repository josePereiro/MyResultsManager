function amend_description(res_dir::String, new_comment::String)
    desc = Core.build_description(res_dir, 
        new_comment * " (Description amended!!!)", sources);
    Core.save_desc(tree, desc);
    Core.add_to_log(tree, desc);
end