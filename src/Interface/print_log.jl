function print_log(res_dir)
    tree = Core.ResDirTree(res_dir);
    println(Core.load_log(tree));
end