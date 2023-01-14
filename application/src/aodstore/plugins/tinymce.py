# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo (https://apprepo.de) project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
TINYMCE_DEFAULT_CONFIG = {
    "content_css": 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css,https://materializecss.com/css/ghpages-materialize.css',
    "height": "320px",
    "width": "960px",
    "menubar": "file edit view insert format tools table help",
    "plugins": "advlist autolink lists link image charmap print preview anchor searchreplace visualblocks code "
               "fullscreen insertdatetime media table paste code help wordcount spellchecker",
    "toolbar": "undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft "
               "aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor "
               "backcolor casechange permanentpen formatpainter removeformat | pagebreak | charmap emoticons | "
               "fullscreen  preview save print | insertfile image media pageembed template link anchor codesample | "
               "a11ycheck ltr rtl | showcomments addcomment code",
    "custom_undo_redo_levels": 10,

    "formats": {
        "h1": {"block": 'h1', "classes": 'light brown-text text-darken-3'},
        "h2": {"block": 'h2', "classes": 'light brown-text text-darken-3'},
        "h3": {"block": 'h3', "classes": 'light brown-text text-darken-3'},
        "h4": {"block": 'h4', "classes": 'light brown-text text-darken-3'},
        "h5": {"block": 'h5', "classes": 'light brown-text text-darken-3'},
        "h6": {"block": 'h6', "classes": 'light brown-text text-darken-3'},
        "p":  { "block": 'p', "classes": 'light brown-text text-darken-3'},
    },
}
