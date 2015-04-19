namespace Scribble {
    public class MainWindow : Gtk.Window {
        private Application parent_app;

        public MainWindow (Application app) {
            parent_app = app;
            set_application (app);

            setup_ui ();
            connect_signals ();
        }

        void setup_ui () {
            set_default_size (600, 400);

            var headerbar = new Gtk.HeaderBar ();
            headerbar.set_title ("Scribble");
            headerbar.show_close_button = true;
            set_titlebar (headerbar);

            add (new ContentView ());
        }

        void connect_signals () { }

    }
}