const res_data_key = "data";

function load_data(datafile::String)
    FileIO.load(datafile)[res_data_key];
end

function save_data(datafile::String, data)
    FileIO.save(datafile, res_data_key, data);
end
