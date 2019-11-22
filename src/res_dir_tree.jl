const source_dir_name = "source";
const desc_file_name = "description";
const log_file_name = "log";


struct ResDirTree
    dirname::AbstractString;
    basename::AbstractString;
    ResDirTree(dir_name, base_name) =
        new(dir_name, basename(base_name));
    ResDirTree(res_dir) = 
        new(dirname(res_dir), basename(res_dir));
end

Base.basename(tree::ResDirTree) = tree.basename;
Base.dirname(tree::ResDirTree) = tree.dirname;
Base.isdir(tree::ResDirTree) = isdir(dirname(tree))
resdir(tree::ResDirTree) = joinpath(dirname(tree), basename(tree));
descfile(tree::ResDirTree) = joinpath(resdir(tree), desc_file_name);
logfile(tree::ResDirTree) = joinpath(resdir(tree), log_file_name);
sourcedir(tree::ResDirTree) = joinpath(resdir(tree), source_dir_name);