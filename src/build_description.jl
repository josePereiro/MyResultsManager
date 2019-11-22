function build_description(comment::String, sources::Vector{String})
    desc = "---------- $(now()) ----------\nComment:\n\t$(comment)\n\nSources:\n";
    for s in sources
        desc *= " - $(s)\n";
    end
    return  desc;
end
# titi delicious de mi corazon

 
