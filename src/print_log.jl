function print_log(res_dir)
    tree = Core.ResDirTree(res_dir);
    println("Log of '$(basename(tree))'")
    println(Core.load_log(tree));
end