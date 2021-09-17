python
import sys

sys.path.insert(0, '/root/gdb_printers/c++')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)

sys.path.insert(0, '/root/gdb_printers/bsv')
#from printers import register_bsv_printers
#register_bsv_printers(None)

import gdb.printing
import printers

gdb.printing.register_pretty_printer(None, printers.build_pretty_printers(None), replace=True)

end

# print symbol off required for pretty-printer gdb.parse_and_eval(..) simplification
set print symbol off 
set print pretty on
set print static-members off

set confirm off

set history save on
set history size 256
set history remove-duplicates 256
set history expansion on
set history filename ~/.gdbhistory

set output-radix 16

set pagination off
