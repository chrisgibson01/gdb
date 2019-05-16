python
import sys
sys.path.insert(0, '/root/gdb_printers/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
end

set print pretty on

set pagination off

set confirm off

set history save on
set history size 256
set history remove-duplicates 256
set history expansion on
set history filename ~/.gdbhistory



