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
    private class PixbuffableIcon : Gtk.Stack {
        private Gtk.Image image;
        private CustomPixbuf custom_pixbuf;
        
        public Gdk.Pixbuf pixbuf {
            get {
                return custom_pixbuf.pixbuf;
            }

            set {
                custom_pixbuf.pixbuf = value;
                custom_pixbuf.visible = true;
                image.visible = false;
            }
        }
        
        public string icon_name {
            owned get {
                return image.icon_name;
            }

            set {
                image.icon_name = value;
                image.visible = true;
                custom_pixbuf.visible = false;
            }
        }
        
        construct {
            build_ui (); 
        }
        
        void build_ui () {
            image = new Gtk.Image ();
            image.icon_size = Gtk.IconSize.BUTTON;
            custom_pixbuf = new CustomPixbuf ();
            
            add (image);
            add (custom_pixbuf);
        }
    }
}