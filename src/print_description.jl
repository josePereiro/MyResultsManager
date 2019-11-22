function print_description(res_dir)
    tree = Core.ResDirTree(res_dir);
    println("Description of '$(basename(tree))'")
    println(Core.load_desc(tree));
end