{ ... }:
{
  programs.sioyek = {
    enable = true;

    # Optional: override package
    # package = pkgs.sioyek;

    ########################################
    # Preferences (https://github.com/ahrm/sioyek/blob/main/pdf_viewer/prefs.config)
    ########################################
    # config = {
    #
    #   # --- General ---
    #   "check_for_updates_on_startup" = "0";
    #   "use_legacy_keybinds" = "0";
    #
    #   # --- Appearance ---
    #   "background_color" = "0.97 0.97 0.97";
    #   "dark_mode_background_color" = "0.0 0.0 0.0";
    #   "dark_mode_contrast" = "0.8";
    #   "text_highlight_color" = "1.0 1.0 0.0";
    #   "visual_mark_color" = "0.0 0.0 0.0 0.1";
    #   "search_highlight_color" = "0.0 1.0 0.0";
    #   "link_highlight_color" = "0.0 0.0 1.0";
    #   "synctex_highlight_color" = "1.0 0.0 1.0";
    #
    #   # --- Search URLs ---
    #   "search_url_s" = "https://scholar.google.com/scholar?q=";
    #   "search_url_l" = "http://gen.lib.rus.ec/scimag/?q=";
    #   "search_url_g" = "https://www.google.com/search?q=";
    #   "middle_click_search_engine" = "s";
    #   "shift_middle_click_search_engine" = "l";
    #
    #   # --- Zoom & Movement ---
    #   "zoom_inc_factor" = "1.2";
    #   "vertical_move_amount" = "1.0";
    #   "horizontal_move_amount" = "1.0";
    #   "move_screen_ratio" = "0.5";
    #
    #   # --- Table of Contents ---
    #   "flat_toc" = "0";
    #   "collapsed_toc" = "0";
    #   "create_table_of_contents_if_not_exists" = "1";
    #   "max_created_toc_size" = "5000";
    #
    #   # --- Window Behavior ---
    #   "should_use_multiple_monitors" = "0";
    #   "should_load_tutorial_when_no_other_file" = "1";
    #   "should_launch_new_window" = "0";
    #
    #   # --- Overview ---
    #   "rerender_overview" = "1";
    #   "overview_offset" = "0.5 0.5";
    #
    #   # --- Bookmarks ---
    #   "sort_bookmarks_by_location" = "1";
    #
    #   # --- Custom Colors ---
    #   "custom_background_color" = "0.180 0.204 0.251";
    #   "custom_text_color" = "0.847 0.871 0.914";
    #
    #   # --- Input ---
    #   "wheel_zoom_on_cursor" = "0";
    #   "touchpad_sensitivity" = "1.0";
    #
    #   # --- Fit Ratio ---
    #   "fit_to_page_width_ratio" = "0.75";
    #
    #   # --- Visual Scroll / Ruler ---
    #   "ruler_mode" = "1";
    #   "ruler_padding" = "1.0";
    #   "ruler_x_padding" = "5.0";
    #
    #   # --- Performance ---
    #   "super_fast_search" = "1";
    #   "multiline_menus" = "1";
    #   "prerender_next_page_presentation" = "1";
    #   "should_warn_about_user_key_override" = "1";
    #
    #   # --- Highlight Colors A-Z ---
    #   "highlight_color_a" = "0.94 0.64 1.00";
    #   "highlight_color_b" = "0.00 0.46 0.86";
    #   "highlight_color_c" = "0.60 0.25 0.00";
    #   "highlight_color_d" = "0.30 0.00 0.36";
    #   "highlight_color_e" = "0.10 0.10 0.10";
    #   "highlight_color_f" = "0.00 0.36 0.19";
    #   "highlight_color_g" = "0.17 0.81 0.28";
    #   "highlight_color_h" = "1.00 0.80 0.60";
    #   "highlight_color_i" = "0.50 0.50 0.50";
    #   "highlight_color_j" = "0.58 1.00 0.71";
    #   "highlight_color_k" = "0.56 0.49 0.00";
    #   "highlight_color_l" = "0.62 0.80 0.00";
    #   "highlight_color_m" = "0.76 0.00 0.53";
    #   "highlight_color_n" = "0.00 0.20 0.50";
    #   "highlight_color_o" = "1.00 0.64 0.02";
    #   "highlight_color_p" = "1.00 0.66 0.73";
    #   "highlight_color_q" = "0.26 0.40 0.00";
    #   "highlight_color_r" = "1.00 0.00 0.06";
    #   "highlight_color_s" = "0.37 0.95 0.95";
    #   "highlight_color_t" = "0.00 0.60 0.56";
    #   "highlight_color_u" = "0.88 1.00 0.40";
    #   "highlight_color_v" = "0.45 0.04 1.00";
    #   "highlight_color_w" = "0.60 0.00 0.00";
    #   "highlight_color_x" = "1.00 1.00 0.50";
    #   "highlight_color_y" = "1.00 1.00 0.00";
    #   "highlight_color_z" = "1.00 0.31 0.02";
    # };
    #
    # ########################################
    # # Keybindings (https://github.com/ahrm/sioyek/blob/main/pdf_viewer/keys.config)
    # ########################################
    # bindings = {
    #
    #   # --- Navigation ---
    #   "goto_beginning" = [ "gg" "<C-<home>>" ];
    #   "goto_end" = [ "<end>" "G" ];
    #   "goto_page_with_page_number" = "<home>";
    #
    #   "goto_left_smart" = "^";
    #   "goto_right_smart" = "$";
    #   "goto_top_of_page;goto_right_smart" = "zz";
    #
    #   # Movement (note: reversed left/right as per default file)
    #   "move_left" = "<right>";
    #   "move_right" = "<left>";
    #
    #   "next_page" = "<C-<pagedown>>";
    #   "previous_page" = "<C-<pageup>>";
    #
    #   "screen_down" = [ "<space>" "<pagedown>" ];
    #   "screen_up" = [ "<S-<space>>" "<pageup>" ];
    #
    #   "next_chapter" = "gc";
    #   "prev_chapter" = "gC";
    #
    #   "prev_state" = [ "<backspace>" "<C-<left>>" ];
    #   "next_state" = [ "<S-<backspace>>" "<C-<right>>" ];
    #
    #   "goto_toc" = "t";
    #
    #   # --- Zoom ---
    #   "zoom_in" = "+";
    #   "zoom_out" = "-";
    #   "fit_to_page_width" = [ "=" "<f9>" ];
    #   "fit_to_page_width_smart" = "<f10>";
    #
    #   # --- Search ---
    #   "search" = [ "<C-f>" "/" ];
    #   "chapter_search" = [ "c<C-f>" "c/" ];
    #   "next_item" = "n";
    #   "previous_item" = "N";
    #
    #   # --- Bookmarks ---
    #   "add_bookmark" = "b";
    #   "delete_bookmark" = "db";
    #   "goto_bookmark" = "gb";
    #   "goto_bookmark_g" = "gB";
    #
    #   # --- Highlights ---
    #   "add_highlight" = "h";
    #   "goto_highlight" = "gh";
    #   "goto_highlight_g" = "gH";
    #   "delete_highlight" = "dh";
    #   "goto_next_highlight" = "gnh";
    #   "goto_prev_highlight" = "gNh";
    #
    #   # --- Marks ---
    #   "set_mark" = "m";
    #   "goto_mark" = "`";
    #
    #   # --- Portals ---
    #   "portal" = "p";
    #   "delete_portal" = "dp";
    #   "goto_portal" = [ "gp" "<tab>" ];
    #   "edit_portal" = [ "P" "<S-<tab>>" ];
    #   "toggle_window_configuration" = "<f12>";
    #
    #   # --- Misc ---
    #   "copy" = "<C-c>";
    #   "toggle_fullscreen" = "<f11>";
    #   "toggle_highlight" = "<f1>";
    #   "command" = ":";
    #   "external_search" = "s";
    #   "toggle_dark_mode" = "<f8>";
    #   "toggle_synctex" = "<f4>";
    #   "toggle_mouse_drag_mode" = "<f6>";
    #   "toggle_visual_scroll" = "<f7>";
    #   "overview_definition" = "l";
    #   "goto_definition" = "<C-]>";
    #   "portal_to_definition" = "]";
    #   "toggle_presentation_mode" = "<f5>";
    #   "quit" = "q";
    #   "open_link" = "f";
    #   "keyboard_select" = "v";
    #   "keyboard_smart_jump" = "F";
    # };
  };
}
