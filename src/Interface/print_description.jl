function print_description(res_dir)
    tree = Core.ResDirTree(res_dir);
    println(Core.load_desc(tree));
end