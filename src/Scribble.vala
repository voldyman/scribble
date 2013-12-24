/* Copyright 2013 Akshay Shekher
*
* This file is part of Scribble
*
* Hello Again is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Hello Again is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Scribble. If not, see http://www.gnu.org/licenses/.
*/

namespace Scribble {
	public class Application : Gtk.Application {
		private MainWindow scribble_window;

		public Application () {
			Object (application_id: "com.voldy.scribble",
					flags: ApplicationFlags.FLAGS_NONE);
			
		}

		protected override void activate () {
			if (scribble_window == null) {
				scribble_window = new MainWindow (this);
			}
			scribble_window.show_all ();
		}
	}
	int main (string[] args) {
		Application app = new Application ();

		return app.run (args);
	}
}