namespace Scribble {
	public class ContentView : Granite.Widgets.ThinPaned {

		private NotesList notes_list;
		private NoteView note_view;
		
		public ContentView () {
//			base (Gtk.Orientation.HORIZONTAL);

			setup_ui ();
		}

		private void setup_ui () {
			notes_list = new NotesList ();
			note_view = new NoteView ();

			notes_list.width_request = 100;
			note_view.width_request = 300;
			
			pack1 (notes_list, true, true);
			pack2 (note_view, true, true);
		}
	}
}