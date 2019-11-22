const deps_dir_name = "source";
const desc_file_name = "description"

struct ResDirTree
    root_dir::AbstractString;
    base_name::AbstractString;
    ResDirTree(root_dir, base_name) =
        new(root_dir, basename(base_name));
    ResDirTree(res_dir) = 
        new(dirname(res_dir), basename(res_dir));
end

get_base_name(tree::ResDirTree) = tree.base_name;
get_root_dir(tree::ResDirTree) = tree.root_dir;
get_res_dir(tree::ResDirTree) = joinpath(get_root_dir(tree), get_base_name(tree));
get_desc_file(tree::ResDirTree) = joinpath(get_res_dir(tree), desc_file_name);