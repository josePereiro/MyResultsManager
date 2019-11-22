const res_data_key = "data";

function load_data(tree::ResDirTree)
    FileIO.load(datafile(tree))[res_data_key];
end

function save_data(tree::ResDirTree, data)
    FileIO.save(datafile(tree), res_data_key, data);
end
