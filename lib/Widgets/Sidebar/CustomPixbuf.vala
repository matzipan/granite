/*
* Copyright (c) 2016 elementary LLC (https://launchpad.net/granite)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 59 Temple Place - Suite 330,
* Boston, MA 02111-1307, USA.
*
*/

namespace Granite.Widgets {
    private class CustomPixbuf : Gtk.DrawingArea {
        private int HEIGHT = 16;
        private int WIDTH = 16;
        
        private Gdk.Pixbuf _pixbuf;
        public Gdk.Pixbuf pixbuf {
            get {
                return _pixbuf;
            }

            set {
                _pixbuf = value;

                queue_draw ();
            }
        }

        public CustomPixbuf () {
            Object ();
        }

        construct {
            set_size_request (WIDTH, HEIGHT);
        }

        public override bool draw (Cairo.Context context) {
            var width = get_allocated_width ();
            var height = get_allocated_height ();
            var padding_top = (height - HEIGHT) / 2;
            
            if(_pixbuf!=null) {
                var surface = Gdk.cairo_surface_create_from_pixbuf (pixbuf, scale_factor, null);
                context.set_source_surface (surface, 0, padding_top);
            }
            
            context.rectangle (0, 0, width, height);
            context.fill ();

            return Gdk.EVENT_STOP;
        }        
    }
}