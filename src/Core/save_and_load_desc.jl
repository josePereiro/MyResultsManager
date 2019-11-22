function load_desc(tree::ResDirTree)
    read(descfile(tree), String);
end

function save_desc(tree::ResDirTree, desc::String)
    write(descfile(tree), desc);
end