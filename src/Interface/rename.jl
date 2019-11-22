function rename(res_dir::String, new_name::String; remove_destination = false)
    mv(res_dir, joinpath(dirname(res_dir), basename(new_name)), 
        remove_destination = remove_destination);
end