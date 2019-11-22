const source_dir_name = "source";
const desc_file_name = "description.txt";
const log_file_name = "log.txt";
const data_file_name = "data.jld2";


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
resdir(tree::ResDirTree) = joinpath(dirname(tree), basename(tree));
Base.isdir(tree::ResDirTree) = isdir(resdir(tree))
sourcedir(tree::ResDirTree) = joinpath(resdir(tree), source_dir_name);
descfile(tree::ResDirTree) = joinpath(resdir(tree), desc_file_name);
logfile(tree::ResDirTree) = joinpath(resdir(tree), log_file_name);
datafile(tree::ResDirTree) = joinpath(resdir(tree), data_file_name);