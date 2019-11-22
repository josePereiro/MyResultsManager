function print_all_descriptions(root::String = ".")
    fs = joinpath.(root, readdir(root));
    for f in fs
        if isdir(f)
            try
                print_description(f);
            catch ignored
            end
        end
    end
end