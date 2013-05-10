import os, sys
import imp

# Using common_env is way to slow so manually add the paths
pj = os.path.join
abspath = os.path.abspath

taccs_base = os.environ['TACCS_BASE_DIR']
add_path = lambda sub: sys.path.append(abspath(pj(taccs_base, sub)))

add_path('taccs/packages')
add_path('plugins/p5_common/packages/')
add_path('plugins/glpcc4/packages/')
add_path('plugins/cots/packages/')
add_path('plugins/demo/packages/')
add_path('plugins/amtrak/packages/')
add_path('plugins/actic/packages/')
add_path('plugins/isave/packages/')
add_path('plugins/kdas/packages/')

import_path  = sys.argv[1]
parts = import_path.split('.', 1)
root = parts[0]
sub = ''
if len(parts) > 1:
   sub = parts[1]

_, dirpath, _ = imp.find_module(root)

sub_path = sub.replace('.', '/')
mod_path = abspath(pj(dirpath, sub_path))
if os.path.isdir(mod_path):
   mod_path = pj(mod_path, '__init__.py')
else:
   mod_path = mod_path + '.py'

sys.stdout.write(mod_path)
