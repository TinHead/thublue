if command -v flatpak >/dev/null
    # Set XDG_DATA_DIRS to include Flatpak installations

    set new_dirs (begin
        set -l output
        echo "$XDG_DATA_HOME/flatpak" ^ /dev/null
        set -l installations (GIO_USE_VFS=local flatpak --installations)
        
        for install_path in $installations
            set share_path "$install_path/exports/share"
            if not contains "$share_path" $XDG_DATA_DIRS
                set output $output $share_path
            end
        end
        echo (string join ':' $output)
    end)

    if test -n "$new_dirs"
        set -x XDG_DATA_DIRS "$new_dirs:$XDG_DATA_DIRS"
    else
        set -x XDG_DATA_DIRS "$XDG_DATA_DIRS"
    end

    functions --erase new_dirs
end
