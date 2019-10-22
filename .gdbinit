python
import sys

sys.path.insert(0, '/root/gdb_printers/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)

class BigIntPP(object):
    def __init__(self, val):
        self._val = val

    def to_string(self):
        if not self._val.address:
           return "bint(nullptr)"

        eval_string = "bsv::to_string(*" + str(self._val.address) + ")"
        return gdb.parse_and_eval(eval_string)

    def display_hint(self):
        return 'string'

    def lookup_type(val):
        if str(val.type) == 'bint':
            return BigIntPP(val)
        else:
            return None

class CScriptPP(object):
    def __init__(self, val):
        self._val = val

    def to_string(self):
        if not self._val.address:
           return "CScript(nullptr)"

        eval_string = "to_string(*" + str(self._val.address) + ")"
        return gdb.parse_and_eval(eval_string)

    def display_hint(self):
        return 'string'

    def lookup_type(val):
        if str(val.type) == 'CScript':
            return CScriptPP(val)
        else:
            return None

import gdb.printing

def build_pretty_printer():
    pp = gdb.printing.RegexpCollectionPrettyPrinter("bsv")
    pp.add_printer('bint', 'bint', BigIntPP)
    pp.add_printer('CScript', 'CScript', CScriptPP)
    return pp


gdb.printing.register_pretty_printer(gdb.current_objfile(),
                                     build_pretty_printer())
end

# print symbol off required for pretty-printer gdb.parse_and_eval(..) simplification
set print symbol off 
set print pretty on

set pagination off

set confirm off

set history save on
set history size 256
set history remove-duplicates 256
set history expansion on
set history filename ~/.gdbhistory



