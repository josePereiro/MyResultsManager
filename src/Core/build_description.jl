function build_description(res_dir::String, comment::String, sources::Vector{String})
    desc = "--- '$(basename(res_dir))' $(now()) ----------\nComment:\n\t$(comment)\n\nSources:\n";
    for s in sources
        desc *= " - $(s)\n";
    end
    return  desc;
end
# titi delicious de mi corazon

 
