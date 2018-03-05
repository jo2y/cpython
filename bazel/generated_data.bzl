MAJOR_VERSION = 3
MINOR_VERSION = 7

CPYTHON_SOABI = 'cpython-%d%dm-x86_64-linux-gnu' % (MAJOR_VERSION,
        MINOR_VERSION)

CPYTHON_COPTS = [
    '-DNDEBUG',
    '-DPy_BUILD_CORE',
    '-O3',
    '-Wall',
    #'-Werror=implicit-function-declaration'
    '-Wextra',
    '-Wno-missing-field-initializers',
    '-Wno-unused-parameter',
    '-Wno-unused-result',
    '-Wno-unused-result',
    '-Wsign-compare',
    '-Wstrict-prototypes',
    '-Wunreachable-code',
    '-fwrapv',
    '-g',
    '-pthread',
    '-std=c99',

    # Required for compiling Python/dynload_shlib.c:
    "-DSOABI='\"%s\"'" % CPYTHON_SOABI,

    # Required for compiling Modules/getpath.c:
    "-DPYTHONPATH='\":\"'",
    "-DPREFIX='\"/usr/local\"'",
    "-DEXEC_PREFIX='\"/usr/local\"'",
    "-DVERSION='\"%d.%d\"'" % (MAJOR_VERSION, MINOR_VERSION),
    "-DVPATH='\"\"'",

    # Suppress known warnings.
    '-Wno-sign-compare',
    '-Wno-unreachable-code',
    '-Wno-unused-variable',
]

CPYTHON_MODULE_COPTS = [
    # The pyextpy module
    '-DHAVE_EXPAT_CONFIG_H=1',
    '-DUSE_PYEXPAT_CAPI',
    '-DXML_POOR_ENTROPY=1',

    # Must not have the macro below.
    #'-DPy_BUILD_CORE',

    # Modules/_decimal/libmpdec/difradix2.c
    '-DCONFIG_64=1',
    '-DASM=1',

    '-DNDEBUG',
    '-O3',
    '-Wall',
    '-Werror=implicit-function-declaration',
    '-Wextra',
    '-Wno-missing-field-initializers',
    '-Wno-unused-parameter',
    '-Wno-unused-result',
    '-Wno-unused-result',
    '-Wsign-compare',
    '-Wstrict-prototypes',
    '-fPIC',
    '-fwrapv',
    '-g',
    '-pthread',
    '-std=c99',
]

CPYTHON_SRCS = ['Modules/_codecsmodule.c',
 'Modules/_collectionsmodule.c',
 'Modules/_functoolsmodule.c',
 'Modules/_io/_iomodule.c',
 'Modules/_io/bufferedio.c',
 'Modules/_io/bytesio.c',
 'Modules/_io/fileio.c',
 'Modules/_io/iobase.c',
 'Modules/_io/stringio.c',
 'Modules/_io/textio.c',
 'Modules/_localemodule.c',
 'Modules/_operator.c',
 'Modules/_sre.c',
 'Modules/_stat.c',
 'Modules/_threadmodule.c',
 'Modules/_tracemalloc.c',
 'Modules/_weakref.c',
 'Modules/atexitmodule.c',
 'Modules/errnomodule.c',
 'Modules/faulthandler.c',
 'Modules/gcmodule.c',
 'Modules/getbuildinfo.c',
 'Modules/getpath.c',
 'Modules/hashtable.c',
 'Modules/itertoolsmodule.c',
 'Modules/main.c',
 'Modules/posixmodule.c',
 'Modules/pwdmodule.c',
 'Modules/signalmodule.c',
 'Modules/symtablemodule.c',
 'Modules/timemodule.c',
 'Modules/xxsubtype.c',
 'Modules/zipimport.c',
 'Objects/abstract.c',
 'Objects/accu.c',
 'Objects/boolobject.c',
 'Objects/bytearrayobject.c',
 'Objects/bytes_methods.c',
 'Objects/bytesobject.c',
 'Objects/call.c',
 'Objects/capsule.c',
 'Objects/cellobject.c',
 'Objects/classobject.c',
 'Objects/codeobject.c',
 'Objects/complexobject.c',
 'Objects/descrobject.c',
 'Objects/dictobject.c',
 'Objects/enumobject.c',
 'Objects/exceptions.c',
 'Objects/fileobject.c',
 'Objects/floatobject.c',
 'Objects/frameobject.c',
 'Objects/funcobject.c',
 'Objects/genobject.c',
 'Objects/iterobject.c',
 'Objects/listobject.c',
 'Objects/longobject.c',
 'Objects/memoryobject.c',
 'Objects/methodobject.c',
 'Objects/moduleobject.c',
 'Objects/namespaceobject.c',
 'Objects/object.c',
 'Objects/obmalloc.c',
 'Objects/odictobject.c',
 'Objects/rangeobject.c',
 'Objects/setobject.c',
 'Objects/sliceobject.c',
 'Objects/structseq.c',
 'Objects/tupleobject.c',
 'Objects/typeobject.c',
 'Objects/unicodectype.c',
 'Objects/unicodeobject.c',
 'Objects/weakrefobject.c',
 'Parser/acceler.c',
 'Parser/bitset.c',
 'Parser/firstsets.c',
 'Parser/grammar.c',
 'Parser/grammar1.c',
 'Parser/listnode.c',
 'Parser/metagrammar.c',
 'Parser/myreadline.c',
 'Parser/node.c',
 'Parser/parser.c',
 'Parser/parsetok.c',
 'Parser/pgen.c',
 'Parser/tokenizer.c',
 'Python/Python-ast.c',
 'Python/_warnings.c',
 'Python/asdl.c',
 'Python/ast.c',
 'Python/ast_opt.c',
 'Python/bltinmodule.c',
 'Python/bootstrap_hash.c',
 'Python/ceval.c',
 'Python/codecs.c',
 'Python/compile.c',
 'Python/dtoa.c',
 'Python/dynamic_annotations.c',
 'Python/dynload_shlib.c',
 'Python/errors.c',
 'Python/fileutils.c',
 'Python/formatter_unicode.c',
 'Python/frozen.c',
 'Python/frozenmain.c',
 'Python/future.c',
 'Python/getargs.c',
 'Python/getcompiler.c',
 'Python/getcopyright.c',
 'Python/getopt.c',
 'Python/getplatform.c',
 'Python/getversion.c',
 'Python/graminit.c',
 'Python/import.c',
 'Python/importdl.c',
 'Python/marshal.c',
 'Python/modsupport.c',
 'Python/mysnprintf.c',
 'Python/mystrtoul.c',
 'Python/pathconfig.c',
 'Python/peephole.c',
 'Python/pyarena.c',
 'Python/pyctype.c',
 'Python/pyfpe.c',
 'Python/pyhash.c',
 'Python/pylifecycle.c',
 'Python/pymath.c',
 'Python/pystate.c',
 'Python/pystrcmp.c',
 'Python/pystrhex.c',
 'Python/pystrtod.c',
 'Python/pythonrun.c',
 'Python/pytime.c',
 'Python/structmember.c',
 'Python/symtable.c',
 'Python/sysmodule.c',
 'Python/thread.c',
 'Python/traceback.c']

CPYTHON_MODULES_DATA = [('_asyncio',
  {'includes': [], 'srcs': ['Modules/_asynciomodule.c'], 'textual_hdrs': []}),
 ('_bisect',
  {'includes': [], 'srcs': ['Modules/_bisectmodule.c'], 'textual_hdrs': []}),
 ('_blake2',
  {'includes': ['Modules/_blake2'],
   'srcs': ['Modules/_blake2/blake2b_impl.c',
            'Modules/_blake2/blake2module.c',
            'Modules/_blake2/blake2s_impl.c'],
   'textual_hdrs': ['Modules/_blake2/impl/blake2b-ref.c',
                    'Modules/_blake2/impl/blake2b.c',
                    'Modules/_blake2/impl/blake2s-ref.c',
                    'Modules/_blake2/impl/blake2s.c']}),
 ('_codecs_cn',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/_codecs_cn.c'],
   'textual_hdrs': []}),
 ('_codecs_hk',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/_codecs_hk.c'],
   'textual_hdrs': []}),
 ('_codecs_iso2022',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/_codecs_iso2022.c'],
   'textual_hdrs': []}),
 ('_codecs_jp',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/_codecs_jp.c'],
   'textual_hdrs': []}),
 ('_codecs_kr',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/_codecs_kr.c'],
   'textual_hdrs': []}),
 ('_codecs_tw',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/_codecs_tw.c'],
   'textual_hdrs': []}),
 ('_crypt',
  {'includes': [], 'srcs': ['Modules/_cryptmodule.c'], 'textual_hdrs': []}),
 ('_csv', {'includes': [], 'srcs': ['Modules/_csv.c'], 'textual_hdrs': []}),
 ('_ctypes_test',
  {'includes': [],
   'srcs': ['Modules/_ctypes/_ctypes_test.c'],
   'textual_hdrs': []}),
 ('_datetime',
  {'includes': [], 'srcs': ['Modules/_datetimemodule.c'], 'textual_hdrs': []}),
 ('_decimal',
  {'includes': ['Modules/_decimal/libmpdec'],
   'srcs': ['Modules/_decimal/_decimal.c',
            'Modules/_decimal/libmpdec/basearith.c',
            'Modules/_decimal/libmpdec/constants.c',
            'Modules/_decimal/libmpdec/context.c',
            'Modules/_decimal/libmpdec/convolute.c',
            'Modules/_decimal/libmpdec/crt.c',
            'Modules/_decimal/libmpdec/difradix2.c',
            'Modules/_decimal/libmpdec/fnt.c',
            'Modules/_decimal/libmpdec/fourstep.c',
            'Modules/_decimal/libmpdec/io.c',
            'Modules/_decimal/libmpdec/memory.c',
            'Modules/_decimal/libmpdec/mpdecimal.c',
            'Modules/_decimal/libmpdec/numbertheory.c',
            'Modules/_decimal/libmpdec/sixstep.c',
            'Modules/_decimal/libmpdec/transpose.c'],
   'textual_hdrs': []}),
 ('_elementtree',
  {'includes': [], 'srcs': ['Modules/_elementtree.c'], 'textual_hdrs': []}),
 ('_heapq',
  {'includes': [], 'srcs': ['Modules/_heapqmodule.c'], 'textual_hdrs': []}),
 ('_json', {'includes': [], 'srcs': ['Modules/_json.c'], 'textual_hdrs': []}),
 ('_lsprof',
  {'includes': [],
   'srcs': ['Modules/_lsprof.c', 'Modules/rotatingtree.c'],
   'textual_hdrs': []}),
 ('_md5',
  {'includes': [], 'srcs': ['Modules/md5module.c'], 'textual_hdrs': []}),
 ('_multibytecodec',
  {'includes': [],
   'srcs': ['Modules/cjkcodecs/multibytecodec.c'],
   'textual_hdrs': []}),
 ('_multiprocessing',
  {'includes': [],
   'srcs': ['Modules/_multiprocessing/multiprocessing.c',
            'Modules/_multiprocessing/semaphore.c'],
   'textual_hdrs': []}),
 ('_opcode',
  {'includes': [], 'srcs': ['Modules/_opcode.c'], 'textual_hdrs': []}),
 ('_pickle',
  {'includes': [], 'srcs': ['Modules/_pickle.c'], 'textual_hdrs': []}),
 ('_posixsubprocess',
  {'includes': [], 'srcs': ['Modules/_posixsubprocess.c'], 'textual_hdrs': []}),
 ('_random',
  {'includes': [], 'srcs': ['Modules/_randommodule.c'], 'textual_hdrs': []}),
 ('_sha1',
  {'includes': [], 'srcs': ['Modules/sha1module.c'], 'textual_hdrs': []}),
 ('_sha256',
  {'includes': [], 'srcs': ['Modules/sha256module.c'], 'textual_hdrs': []}),
 ('_sha3',
  {'includes': ['Modules/_sha3'],
   'srcs': ['Modules/_sha3/sha3module.c'],
   'textual_hdrs': ['Modules/_sha3/kcp/KeccakHash.c',
                    'Modules/_sha3/kcp/KeccakP-1600-64.macros',
                    'Modules/_sha3/kcp/KeccakP-1600-inplace32BI.c',
                    'Modules/_sha3/kcp/KeccakP-1600-opt64.c',
                    'Modules/_sha3/kcp/KeccakP-1600-unrolling.macros',
                    'Modules/_sha3/kcp/KeccakSponge.c',
                    'Modules/_sha3/kcp/KeccakSponge.inc']}),
 ('_sha512',
  {'includes': [], 'srcs': ['Modules/sha512module.c'], 'textual_hdrs': []}),
 ('_socket',
  {'includes': [], 'srcs': ['Modules/socketmodule.c'], 'textual_hdrs': []}),
 ('_struct',
  {'includes': [],
   'srcs': ['Modules/_math.c', 'Modules/_struct.c'],
   'textual_hdrs': []}),
 ('_testbuffer',
  {'includes': [], 'srcs': ['Modules/_testbuffer.c'], 'textual_hdrs': []}),
 ('_testcapi',
  {'includes': [], 'srcs': ['Modules/_testcapimodule.c'], 'textual_hdrs': []}),
 ('_testimportmultiple',
  {'includes': [],
   'srcs': ['Modules/_testimportmultiple.c'],
   'textual_hdrs': []}),
 ('_testmultiphase',
  {'includes': [], 'srcs': ['Modules/_testmultiphase.c'], 'textual_hdrs': []}),
 ('_xxtestfuzz',
  {'includes': [],
   'srcs': ['Modules/_xxtestfuzz/_xxtestfuzz.c',
            'Modules/_xxtestfuzz/fuzzer.c'],
   'textual_hdrs': []}),
 ('array',
  {'includes': [], 'srcs': ['Modules/arraymodule.c'], 'textual_hdrs': []}),
 ('audioop',
  {'includes': [], 'srcs': ['Modules/audioop.c'], 'textual_hdrs': []}),
 ('binascii',
  {'includes': [], 'srcs': ['Modules/binascii.c'], 'textual_hdrs': []}),
 ('cmath',
  {'includes': [],
   'srcs': ['Modules/_math.c', 'Modules/cmathmodule.c'],
   'textual_hdrs': []}),
 ('fcntl',
  {'includes': [], 'srcs': ['Modules/fcntlmodule.c'], 'textual_hdrs': []}),
 ('grp', {'includes': [], 'srcs': ['Modules/grpmodule.c'], 'textual_hdrs': []}),
 ('math',
  {'includes': [],
   'srcs': ['Modules/_math.c', 'Modules/mathmodule.c'],
   'textual_hdrs': []}),
 ('mmap',
  {'includes': [], 'srcs': ['Modules/mmapmodule.c'], 'textual_hdrs': []}),
 ('nis', {'includes': [], 'srcs': ['Modules/nismodule.c'], 'textual_hdrs': []}),
 ('ossaudiodev',
  {'includes': [], 'srcs': ['Modules/ossaudiodev.c'], 'textual_hdrs': []}),
 ('parser',
  {'includes': [], 'srcs': ['Modules/parsermodule.c'], 'textual_hdrs': []}),
 ('pyexpat',
  {'includes': ['Modules/expat'],
   'srcs': ['Modules/expat/xmlparse.c',
            'Modules/expat/xmlrole.c',
            'Modules/expat/xmltok.c',
            'Modules/pyexpat.c'],
   'textual_hdrs': ['Modules/expat/xmltok_impl.c',
                    'Modules/expat/xmltok_ns.c']}),
 ('resource',
  {'includes': [], 'srcs': ['Modules/resource.c'], 'textual_hdrs': []}),
 ('select',
  {'includes': [], 'srcs': ['Modules/selectmodule.c'], 'textual_hdrs': []}),
 ('spwd',
  {'includes': [], 'srcs': ['Modules/spwdmodule.c'], 'textual_hdrs': []}),
 ('syslog',
  {'includes': [], 'srcs': ['Modules/syslogmodule.c'], 'textual_hdrs': []}),
 ('termios',
  {'includes': [], 'srcs': ['Modules/termios.c'], 'textual_hdrs': []}),
 ('unicodedata',
  {'includes': [], 'srcs': ['Modules/unicodedata.c'], 'textual_hdrs': []}),
 ('xxlimited',
  {'includes': [], 'srcs': ['Modules/xxlimited.c'], 'textual_hdrs': []}),
 ('zlib',
  {'includes': [], 'srcs': ['Modules/zlibmodule.c'], 'textual_hdrs': []})]
