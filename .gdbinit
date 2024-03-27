python
import sys

#sys.path.insert(0, '/usr/share/gcc/python')
#from libstdcxx.v6.printers import register_libstdcxx_printers
#register_libstdcxx_printers (None)

sys.path.insert(0, '/root/gdb_printers/c++')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)

#sys.path.insert(1, '/root/gdb_printers/Boost-Pretty-Printer')
#import boost
#boost.register_printers(boost_version=(1,71,0))

# bsv printers
#sys.path.insert(1, '/root/gdb_printers/bsv')
#import gdb.printing
#from bsv_printers import build_pretty_printers
#gdb.printing.register_pretty_printer(None, build_pretty_printers(None), replace=True)

end

# print symbol off required for pretty-printer gdb.parse_and_eval(..) simplification
#set print symbol off 
set print pretty on
set print static-members off

set confirm off
set pagination off
#set output-radix 16

set history save on
set history expansion on

set directories ~/sv/src

#skip -gfi /usr/include/boost/**/*.hpp # doesn't work
skip -gfi /usr/include/boost/test/utils/basic_cstring/*.hpp
skip -gfi /usr/include/boost/test/utils/*.hpp
skip -gfi /usr/include/c++/9/bits/*.h
#skip -gfi /usr/include/boost/test/utils/basic_cstring/basic_cstring.hpp

