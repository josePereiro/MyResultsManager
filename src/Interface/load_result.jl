function load_result(res_dir)
    tree = Core.ResDirTree(res_dir);
    return Core.load_data(tree);
end