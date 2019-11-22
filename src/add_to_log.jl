function add_to_log(tree, text)
    l = logfile(tree);
    if isfile(l)
        text = "$(now()) \n $(text) \n";
        write(st, text);
    else
        st = open(l, "a");
        text = "\n $(now()) \n $(text) \n";
        write(st, text);
        close(st);
    end
end