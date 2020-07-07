# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo project
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
import os
import configparser


class ConfigFile(object):
    parser = configparser.ConfigParser()
    file = None

    def __init__(self, file=None):
        if file is None:
            return None

        if self.file is None:
            self.file = file

        if self.file is None:
            return None

        if os.path.exists(self.file):
            self.parser.read(self.file)
            return None

        folder = os.path.dirname(self.file)
        if not os.path.exists(folder):
            os.makedirs(folder)

        with open(self.file, 'w') as stream:
            self.parser.write(stream)
            stream.close()

        self.parser.read(self.file)
        return None

    def get(self, name, default=None):
        if self.file is None:
            return None

        if not self.has(name):
            return self.set(name, default)

        section, option = name.split('.', 1)
        if not self.parser.has_section(section):
            return None

        if self.parser.has_option(section, option):
            return self.parser.get(section, option)
        return None

    def set(self, name, value=None):
        if self.file is None:
            return None

        section, option = name.split('.', 1)

        if not self.parser.has_section(section):
            self.parser.add_section(section)

        self.parser.set(section, option, '%s' % value)
        with open(self.file, 'w') as stream:
            self.parser.write(stream)
            stream.close()
        return value

    def has(self, name):
        if self.file is None:
            return None

        section, option = name.split('.', 1)

        if self.parser.has_section(section):
            return self.parser.has_option(section, option)

        return False
