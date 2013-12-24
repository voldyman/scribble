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
			this.destroy.connect (Gtk.main_quit);

			set_default_size (600, 400);
			add (new ContentView ());
		}

		void connect_signals () { }
		
	}
}