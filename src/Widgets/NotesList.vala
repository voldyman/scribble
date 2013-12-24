namespace Scribble {

	public class NotesList : Gtk.Grid {
		
		private enum Columns {
			TITLE,
			DRAGHANDLE,
			N_COLUMNS
		}

		private Gtk.ListStore notes_list;
		private Gtk.TreeView  tree_view;
		private Gtk.ScrolledWindow scrolled_window;
		private Gtk.Entry notes_title_entry;
		
		
		public NotesList () {
			setup_ui ();
			load_list ();
		}

		private void setup_ui () {
			// Initilize all the widgets
			scrolled_window = new Gtk.ScrolledWindow (null, null);
			notes_title_entry = new Gtk.Entry ();
			tree_view = new Gtk.TreeView ();

			notes_list = new Gtk.ListStore (Columns.N_COLUMNS,
											typeof(string),
											typeof(string));

			tree_view.name = "NotesList";
			tree_view.headers_visible = false;
			tree_view.enable_search = false;
			tree_view.hexpand = true;
			tree_view.vexpand = true;
			tree_view.valign = Gtk.Align.START;
			tree_view.reorderable = true;
			tree_view.model = notes_list;
			
			scrolled_window.expand = true;
			scrolled_window.add_with_viewport (tree_view);

			// Setup columns
			Gtk.TreeViewColumn column;
			
			var title_renderer = new Gtk.CellRendererText ();
			var draghandle_renderer = new Gtk.CellRendererPixbuf ();

			title_renderer.xpad = 6;
			column = new Gtk.TreeViewColumn.with_attributes ("Title", title_renderer, "text", Columns.TITLE);
			column.expand = true;
			tree_view.append_column (column);

			draghandle_renderer.xpad = 6;
			column = new Gtk.TreeViewColumn.with_attributes ("Drag", draghandle_renderer, "icon_name", Columns.DRAGHANDLE);
			tree_view.append_column (column);

			notes_title_entry.margin = 2;
			// Add them to the grid
			attach (notes_title_entry, 0, 0, 1, 1);
			attach (scrolled_window, 0, 1, 1, 1);
		}

		private void load_list () {
			for (int i=0; i < 10; i++) {
				add_note ("woah" + i.to_string ());
			}
		}
		private void add_note (string title) {
			if (title == "") {
				return;
			}
			
			Gtk.TreeIter iter;
			notes_list.append (out iter);
			notes_list.set (iter, Columns.TITLE, title,
							Columns.DRAGHANDLE, "view-list-symbolic");
		}
	}
}