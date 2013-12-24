namespace Scribble {
    void main (string[] args) {
        Gtk.init (ref args);
        var w = new Gtk.Window();
        w.destroy.connect (Gtk.main_quit);
        var a = new NotesList ();
        w.add (a);
        w.show_all ();
        Gtk.main ();
    }
}