namespace Scribble {
    public class NoteView : Gtk.ScrolledWindow {
		private Gtk.TextView note_text_view;
		
        public NoteView () {
            setup_ui ();
        }

        private void setup_ui () {
			note_text_view = new Gtk.TextView ();
			
            note_text_view.left_margin = 110;
            note_text_view.pixels_above_lines = 10;
			note_text_view.get_style_context ().add_provider (get_css_provider (), Gtk.STYLE_PROVIDER_PRIORITY_USER);

			add_with_viewport (note_text_view);
        }

        private static Gtk.CssProvider get_css_provider () {
            var cssp = new Gtk.CssProvider ();
            var css_file = File.new_for_path (Constants.PKGDATADIR + "/noteview.css");

            try {
                cssp.load_from_file (css_file);
            } catch (Error e) {
                error (e.message);
            }
            return cssp;

        }
    }
}