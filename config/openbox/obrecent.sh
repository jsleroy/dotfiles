#!/bin/bash
#
# gnome-places.sh
# Dynamically generates a menu for the Openbox3-Windowmanager
# that tries to resemble the Gnome2 Places-Menu.
#
# Copyright (C) 2005 Sebastian Sareyko <smoon at nooms.de>
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

# rudely ripped from gnome-places into a single pipe menu for super speed!
# maybe it does not work 'correctly' but it is good enough...
# david@chalkskeletons.com

LABEL_RECENTLYUSED="Recent Documents"


function generate_recentlyused_menu {

  for uri in `grep "URI>file" ${HOME}/.recently-used | head -n10 |\
    sed -r "s/<URI>file:\/\/(.*)<\/URI>/\1/g"` ; do

    uri=`echo "${uri}" | perl -pe 's/%([a-fA-F0-9]{2})/chr(hex($1))/ge;'`

    if [ -f "${uri}" ]; then
      echo '<item label="'`basename ${uri}`'">'
    else
      echo '<item label="* '`basename ${uri}`'">'
    fi

    echo '<action name="Execute"><execute>'
    echo "gnome-open ${uri}"
    echo '</execute></action>'
    echo '</item>'
  done
echo '<separator/>'
  echo '<item label="Clear Recent Documents">'
  echo '<action name="Execute"><execute>'
  echo "rm ${HOME}/.recently-used</execute></action>"
  echo '</item>'

}

echo '<openbox_pipe_menu>'

generate_recentlyused_menu

echo '</openbox_pipe_menu>'

