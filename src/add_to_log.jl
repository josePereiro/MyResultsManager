function add_to_log(tree::ResDirTree, text::String)
    lfile = logfile(tree);
    if isfile(lfile)
        st = open(lfile, "a");
        text = "\n$(text)\n";
        write(st, text);
        close(st);
    else
        text = "$(text)\n";
        write(lfile, text);
    end
end